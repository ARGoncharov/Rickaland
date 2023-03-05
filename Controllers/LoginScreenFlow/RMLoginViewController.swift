//
//  ViewController.swift
//  Rickaland
//
//  Created by Алексей  on 03.03.2023.
//

import UIKit
import SnapKit

class RMLoginViewController: UIViewController {
    
    //MARK: - Properties
    
    var viewModel: RMLoginViewModel!

    //MARK: - UI Components
    
    private var RMEmailTFBottomLine: UIView = {
        let line = UIView()
        line.backgroundColor = .gray
        return line
    }()
    
    private var RMPasswordTFBottomLine: UIView = {
        let line = UIView()
        line.backgroundColor = .gray
        return line
    }()
    
    private lazy var RMSecondLogo: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "secondLogo")
        imageView.image = image
        return imageView
    }()
    
    private lazy var RMEmailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.placeholder = "Enter your email"
        textField.borderStyle = .none
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 24)
        return textField
    }()
    
    private lazy var RMPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.placeholder = "Enter your password"
        textField.borderStyle = .none
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 24)
        return textField
    }()
    
    private lazy var RMLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(red: 6/255, green: 176/255, blue: 199/255, alpha: 1)
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var RMRegisterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(red: 6/255, green: 176/255, blue: 199/255, alpha: 1)
        button.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var RMForgotButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot password?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(didTapForgotPasswordButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RMLoginViewModel(email: "", password: "")
        viewModel.delegate = self
        view.addSubviews(
            RMSecondLogo,
            RMEmailTextField,
            RMEmailTFBottomLine,
            RMPasswordTextField,
            RMPasswordTFBottomLine,
            RMLoginButton,
            RMRegisterButton,
            RMForgotButton
        )
        addConstraints()
        
        
        view.backgroundColor = .systemBackground
    }
    
    //MARK: - Private Methods
    
    private func addConstraints() {
        
        RMSecondLogo.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(100)
            maker.top.equalToSuperview().inset(60)
            maker.size.equalTo(CGSize(width: 45, height: 60))
        }
        
        RMEmailTextField.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(40)
            maker.top.equalToSuperview().inset(250)
        }
        
        RMEmailTFBottomLine.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(35)
            maker.top.equalTo(RMEmailTextField).inset(40)
            maker.height.equalTo(1.5)
        }
        
        RMPasswordTextField.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(40)
            maker.top.equalToSuperview().inset(350)
        }
        
        RMPasswordTFBottomLine.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(35)
            maker.top.equalTo(RMPasswordTextField).inset(40)
            maker.height.equalTo(1.5)
        }
        
        RMLoginButton.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(35)
            maker.top.equalTo(RMPasswordTFBottomLine).inset(50)
            maker.height.equalTo(50)
        }
        
        RMRegisterButton.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(35)
            maker.top.equalTo(RMLoginButton).inset(60)
            maker.height.equalTo(50)
        }
    
        RMForgotButton.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(120)
            maker.top.equalTo(RMRegisterButton).inset(80)
        }
    }
    
    @objc private func didTapLoginButton() {
        viewModel.loginCheck(email: RMEmailTextField.text ?? "", password: RMPasswordTextField.text ?? "")
    }
    
    @objc private func didTapRegisterButton() {
        let registerVC = RMRegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    @objc private func didTapForgotPasswordButton() {
        let forgorVC = RMForgotPasswordViewController()
        navigationController?.pushViewController(forgorVC, animated: true)
    }
}

extension RMLoginViewController: RMLoginViewModelDelegate {
    func didAuthenticateUser() {
        let tabBarController = RMTabBarController()
        navigationController?.pushViewController(tabBarController, animated: true)
    }
}

