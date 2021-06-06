import UIKit

class CovidDataViewController: UIViewController {

    private var presenter: CovidDataPresenter!
    private var tableView : UITableView!
    private var titleLabel: UILabel!
    let cellIdentifier = "searchCellId"
    let headerIdentifier = "headerId"
    private var dataList : [(String,Int)] = []
    

    init(presenter: CovidDataPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        addConstraints()
        
        setData()
    }

    func setData() {
        presenter.fetchData()  { data in
                self.dataList = data.dataList
                DispatchQueue.main.sync {
                    self.tableView.reloadData()
                }
        }
    }
    
    func buildViews() {
        view.backgroundColor = UIColor(red: 0.49, green: 0.78, blue: 0.94, alpha: 1.00)
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        titleLabel.textColor = .white
        titleLabel.text = "Covid World Statistics"
        
        tableView = UITableView()
        tableView.rowHeight = 100
        tableView.register(CovidTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.isUserInteractionEnabled = true
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }

    private func addConstraints() {
        titleLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        titleLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: 30)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 10)
        tableView.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 10)
        tableView.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 30)
        tableView.autoPinEdge(toSuperviewEdge: .bottom)
    }
    
}

extension CovidDataViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.rowCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CovidTableViewCell
        let data = dataList[indexPath.row]
        cell.set(model: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
