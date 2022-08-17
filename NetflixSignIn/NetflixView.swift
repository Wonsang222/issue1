//
//  NetflixView.swift
//  NetflixSignIn
//
//  Created by 황원상 on 2022/08/12.
//

import UIKit

class NetflixView: UIView {
    
    //MARK: - Id
    lazy var idView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.addSubview(idTextField)
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.addSubview(idLabel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let idLabel:UILabel = {
        let label = UILabel()
        label.text = "ID"
        label.font = .systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints  = false
        return label
    }()
    
    let idTextField:UITextField = {
        let tf = UITextField()
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.textColor = .white
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.addTarget(self, action: #selector(textFieldChanged(textField:)), for: .editingChanged)
        return tf
    }()
    
    //MARK: - Password
    lazy var passwordView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.addSubview(passwordTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordSecureButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordLabel:UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints  = false
        return label
    }()
    
    let passwordTextField:UITextField = {
        let tf = UITextField()
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.textColor = .white
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        tf.addTarget(self, action: #selector(textFieldChanged(textField:)), for: .editingChanged)
        return tf
    }()
    
    let passwordSecureButton:UIButton = {
        let button = UIButton()
        button.setTitle("revealing", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        button.addTarget(NetflixView.self, action: #selector(setupSecureButton), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Buttons
    
    let signInButton:UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        button.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.isEnabled = false
        button.backgroundColor = .clear
        button.layer.cornerRadius = 6
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let findPasswordButton:UIButton = {
        let button = UIButton()
        button.setTitle("Find Password", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.isEnabled = false
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: - Stack
    
    lazy var stack:UIStackView = {
        let st = UIStackView(arrangedSubviews: [idView, passwordView, signInButton])
        st.spacing = 18
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .fill
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    
    //MARK: - Etc
    lazy var idLabelConstraint = idLabel.centerYAnchor.constraint(equalTo: idView.centerYAnchor)
    lazy var passwordLabelConstaraint = passwordLabel.centerYAnchor.constraint(equalTo: passwordView.centerYAnchor)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        [stack, findPasswordButton].forEach{addSubview($0)}
        updateConstraints()
        [idTextField, passwordTextField].forEach{$0.delegate = self
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            stack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            stack.heightAnchor.constraint(equalToConstant: 180),
            stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            findPasswordButton.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 10),
            findPasswordButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            findPasswordButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            findPasswordButton.heightAnchor.constraint(equalToConstant: 36),
            
            idLabel.leadingAnchor.constraint(equalTo: idView.leadingAnchor, constant: 8),
            idLabel.trailingAnchor.constraint(equalTo: idView.trailingAnchor, constant: 8),
            idLabelConstraint,
            
            idTextField.topAnchor.constraint(equalTo: idView.topAnchor, constant: 15),
            idTextField.bottomAnchor.constraint(equalTo: idView.bottomAnchor, constant: 2),
            idTextField.leadingAnchor.constraint(equalTo: idView.leadingAnchor, constant: 8),
            idTextField.trailingAnchor.constraint(equalTo: idView.trailingAnchor, constant: -8),
            
            passwordLabel.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 8),
            passwordLabel.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: 8),
            passwordLabelConstaraint,
            
            passwordTextField.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 15),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 2),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: 8),
        
            passwordSecureButton.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 15),
            passwordSecureButton.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: -15),
            passwordSecureButton.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -8)
        ])
        super.updateConstraints()
    }
    
    @objc func setupSecureButton(){
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc func textFieldChanged(textField:UITextField){
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let email = idTextField.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty
        else {
            signInButton.backgroundColor = .clear
            signInButton.isEnabled = false
            return
        }
        signInButton.backgroundColor = .red
        signInButton.isEnabled = true
    }
}

extension NetflixView:UITextFieldDelegate{
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == idTextField{
            idLabelConstraint.constant = -13
            idLabel.font = .systemFont(ofSize: 11)
            idView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
        if textField == passwordTextField{
            passwordLabelConstaraint.constant = -13
            passwordView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            passwordLabel.font = .systemFont(ofSize: 11)
            passwordSecureButton.isEnabled = true
        }
        UIView.animate(withDuration: 0.3) {
            self.stack.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == idTextField{
            idLabelConstraint.constant = 0
            idLabel.font = .systemFont(ofSize: 18)
            idView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            idLabel.text = ""
        }
        if textField == passwordTextField{
            passwordLabelConstaraint.constant = 0
            passwordView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            passwordLabel.font = .systemFont(ofSize: 18)
            passwordLabel.text = ""
        }
        UIView.animate(withDuration: 0.3) {
            self.stack.layoutIfNeeded()
        }
        
    }
    
}
