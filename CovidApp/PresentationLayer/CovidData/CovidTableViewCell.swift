import UIKit
import PureLayout

class CovidTableViewCell: UITableViewCell {

    var title : UILabel!
    var number : UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            buildViews()
            addConstraints()
        }

    required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViews() {
        self.backgroundColor = UIColor(red: 0.49, green: 0.78, blue: 0.94, alpha: 1.00)
        
        title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 20.0)
        title.textColor = .white
        number = UILabel()
        number.font = UIFont.boldSystemFont(ofSize: 25.0)
        number.textColor = .white
        
        addSubview(title)
        addSubview(number)
    }
    
    private func addConstraints() {
        title.autoAlignAxis(toSuperviewAxis: .horizontal)
        title.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 20)
        
        number.autoPinEdge(.leading, to: .trailing, of: title, withOffset: 10)
        number.autoAlignAxis(toSuperviewAxis: .horizontal)
        number.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 10)
    }
    
    func set(model: (String, Int)) {
        title.text = model.0
        number.text = String(model.1)
    }
}
