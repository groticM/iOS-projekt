//
//  VaccineDataViewContoller.swift
//  CovidApp
//
//  Created by Marta Grotic on 06.06.2021..
//

import Foundation
import UIKit

class VaccineDataViewController: UIViewController {
    private var scrollView: UIScrollView!
    private var titleLabel: UILabel!
    private var nameView: UIView!
    private var nameField: UITextField!
    private var surnameView: UIView!
    private var surname: UITextField!
    private var birthday: UITextField!
    private var OIB: UITextField!
    private var surnameField: UITextField!
    private var submitButton: UIButton!
    private var passwordButton: UIButton!
    private var hiddenErrorLabel: UILabel!
    
    private let radius: CGFloat = 25
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        addConstraints()
        
    }
    
    private func buildViews() {
        view.backgroundColor = Colors().backgroundColor
        
        // ScrollView
        scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.alwaysBounceVertical = true
        scrollView.automaticallyAdjustsScrollIndicatorInsets = true

        // Title
        titleLabel = UILabel()
        scrollView.addSubview(titleLabel)
        titleLabel.text = "Vaccine"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 35)
        
        // Name
        nameView = UIView()
        scrollView.addSubview(nameView)
        nameField = UITextField()
        designTextField(viewField: nameView, textField: nameField, text: "Name:")
        nameField.addTarget(self, action: #selector(updateName), for: .editingDidBegin)
        nameField.addTarget(self, action: #selector(doneName), for: .editingDidEnd)
        
        // Surname
        surnameView = UIView()
        scrollView.addSubview(nameView)
        nameField = UITextField()
        designTextField(viewField: nameView, textField: nameField, text: "Name:")
        nameField.addTarget(self, action: #selector(updateName), for: .editingDidBegin)
        nameField.addTarget(self, action: #selector(doneName), for: .editingDidEnd)


        // Login button
        /*loginButton = UIButton()
        scrollView.addSubview(loginButton)
        loginButton.isHidden = true
        loginButton.isEnabled = false
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(Color().buttonTextColor, for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "HelveticaNeue-bold", size: 20)
        loginButton.layer.cornerRadius = radius
        loginButton.backgroundColor = .white
        loginButton.alpha = 0
        loginButton.addTarget(self, action: #selector(attemptLogin), for: .touchUpInside)*/

        
    }
    
    private func addConstraints() {
        scrollView.autoPinEdge(.top, to: .top, of: view)
        scrollView.autoPinEdge(.bottom, to: .bottom, of: view)
        scrollView.autoPinEdge(.leading, to: .leading, of: view)
        scrollView.autoPinEdge(.trailing, to: .trailing, of: view)
        
        titleLabel.autoPinEdge(.top, to: .top, of: scrollView, withOffset: 25)
        titleLabel.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 55)
        titleLabel.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 55)
        titleLabel.autoSetDimension(.height, toSize: 50)
        
        nameView.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 20)
        nameView.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 25)
        nameView.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 25)
        nameView.autoSetDimension(.height, toSize: 50)
        
        
    }
    
    private func designTextField(viewField: UIView, textField: UITextField, text: String){
        viewField.backgroundColor = Colors().backgroundColor
        viewField.clipsToBounds = true
        viewField.addSubview(textField)
        
        let labelField = UILabel()
        viewField.addSubview(labelField)
        labelField.backgroundColor = Colors().backgroundColor
        labelField.text = text
        labelField.textColor = .black
        
        labelField.autoPinEdge(.top, to: .top, of: viewField)
        labelField.autoPinEdge(.leading, to: .leading, of: viewField, withOffset: 5)
        labelField.autoPinEdge(.trailing, to: .trailing, of: viewField, withOffset: 100)
        labelField.autoPinEdge(.bottom, to: .bottom, of: viewField)
        
        viewField.addSubview(textField)
        textField.backgroundColor = .blue
        textField.placeholder = text
        textField.tintColor = .black
        textField.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        textField.autocapitalizationType = .none
        
        textField.autoPinEdge(.top, to: .top, of: viewField)
        textField.autoPinEdge(.leading, to: .leading, of: viewField, withOffset: 80)
        textField.autoPinEdge(.trailing, to: .trailing, of: viewField, withOffset: 5)
        textField.autoPinEdge(.bottom, to: .bottom, of: viewField)
        
    }
    
    @objc
    private func updateName() {
        nameField.layer.masksToBounds = true
        nameField.layer.borderWidth = 2
        nameField.layer.borderColor = UIColor.black.cgColor
        
    }
    
    @objc
    private func doneName() {
        nameField.layer.borderWidth = 0
        
    }
    
}
