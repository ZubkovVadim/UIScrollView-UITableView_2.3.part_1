

import UIKit

class LogInViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    private let logoImageView: UIImageView = {
        let logo = UIImageView()
        logo.contentMode = .scaleAspectFill
        logo.image = #imageLiteral(resourceName: "logo")
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    private let emailOrPhoneTextField: UITextField = {
       let emailOrPhoneTextField = UITextField()
        emailOrPhoneTextField.backgroundColor = .systemGray6
        emailOrPhoneTextField.textColor = .black
        emailOrPhoneTextField.autocapitalizationType = .none
        emailOrPhoneTextField.leftView = UIView(frame: CGRect(x: 0,
                                                              y: 0,
                                                              width: 10,
                                                              height: emailOrPhoneTextField.frame.height))
        emailOrPhoneTextField.leftViewMode = .always
        emailOrPhoneTextField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        emailOrPhoneTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailOrPhoneTextField.layer.borderWidth = 0.5
        emailOrPhoneTextField.layer.cornerRadius = 10
        emailOrPhoneTextField.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        emailOrPhoneTextField.placeholder = "Email or phone"
        emailOrPhoneTextField.translatesAutoresizingMaskIntoConstraints = false
        return emailOrPhoneTextField
    }()
    private let passwordTextField: UITextField = {
       let passwordTextField = UITextField()
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.textColor = .black
        passwordTextField.autocapitalizationType = .none
        passwordTextField.leftView = UIView(frame: CGRect(x: 0,
                                                              y: 0,
                                                              width: 10,
                                                              height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()
    
    private let logInButton: UIButton = {
        let logInButton = UIButton(type: .system)
        logInButton.layer.masksToBounds = true
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setBackgroundImage(UIImage(named: "MyColor1"), for: .normal)
        logInButton.layer.cornerRadius = 10
        logInButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.isEnabled = false

        return logInButton
    }()
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        scrollView.keyboardDismissMode = .onDrag
        containerView.addSubview(logoImageView)
        containerView.addSubview(emailOrPhoneTextField)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(logInButton)
        emailOrPhoneTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        navigationController?.navigationBar.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyBoardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyBoardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyBoardSize.height, right: 0)
        }
    }
    
    @objc func keyBoardWillHide(notification:  NSNotification){
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    override func viewWillLayoutSubviews() {
        let constrains = [
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            
            logoImageView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
            logoImageView.bottomAnchor.constraint(equalTo: emailOrPhoneTextField.topAnchor, constant: -120),
            
           
            emailOrPhoneTextField.leadingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            emailOrPhoneTextField.trailingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            emailOrPhoneTextField.heightAnchor.constraint(equalToConstant: 50),
            
            
            passwordTextField.topAnchor.constraint(equalTo: emailOrPhoneTextField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
                                                          
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -120)
        ]
        NSLayoutConstraint.activate(constrains)

    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func tap() {
        let vc = ProfileViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func textFieldDidChange () {
        if passwordTextField.text!.isEmpty || emailOrPhoneTextField.text!.isEmpty {
            logInButton.isEnabled = false
        } else {
            logInButton.isEnabled = true
        }

    }
}
