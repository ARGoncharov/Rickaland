//
//  RMForgotPasswordViewController.swift
//  Rickaland
//
//  Created by Алексей  on 04.03.2023.
//

import UIKit
import SnapKit

final class RMForgotPasswordViewController: UIViewController, UITextFieldDelegate {
    
    private lazy var RMImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "rickPasswordImage")
        imageView.image = image
        return imageView
    }()
    
    private lazy var RMSpeechBubbleImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "speechBubble")
        imageView.image = image
        return imageView
    }()
    
    private lazy var RMPasswordTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Tell me Morty's pet's name, \n and i ll give you the code \n to type in. You can enter it \n in the texfield above"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var RMPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.placeholder = "Enter the name"
        textField.borderStyle = .none
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 24)
        return textField
    }()
    
    private lazy var RMPasswordBottomLine: UIView = {
        let line = UIView()
        line.backgroundColor = .gray
        return line
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(
            RMImage,
            RMSpeechBubbleImage,
            RMPasswordTextLabel,
            RMPasswordTextField,
            RMPasswordBottomLine
        )
        addConstraints()
        passwordCheck(petsName: "")
        RMPasswordTextField.delegate = self
        
        view.backgroundColor = .systemBackground
    }
    
    private func addConstraints() {
        RMImage.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(190)
            maker.top.equalToSuperview().inset(605)
            maker.height.equalTo(300)
            maker.width.equalTo(250)
        }
        
        RMSpeechBubbleImage.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(20)
            maker.top.equalToSuperview().inset(400)
            maker.height.equalTo(250)
            maker.width.equalTo(250)
        }
        
        RMPasswordTextLabel.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(45)
            maker.top.equalToSuperview().inset(460)
        }
        
        RMPasswordTextField.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(50)
            maker.top.equalToSuperview().inset(150)
        }
        
        RMPasswordBottomLine.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(35)
            maker.top.equalTo(RMPasswordTextField).inset(40)
            maker.height.equalTo(1.5)
        }
    }
    
    private func passwordCheck(petsName: String?) {
        guard let name = petsName, !name.isEmpty else {
            RMPasswordTextLabel.text = "Tell me Morty's pet's name, \n and i ll give you the code \n to type in. You can enter it \n in the texfield above"
            
            return
        }
        if name == "Snuffles" {
            RMPasswordTextLabel.text = "The password is 1234"
        } else {
            RMPasswordTextLabel.text = "Try again!"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordCheck(petsName: textField.text ?? "")
        textField.resignFirstResponder()
        return true
    }
}
