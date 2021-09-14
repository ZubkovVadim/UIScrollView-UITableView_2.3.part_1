import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    private let headerImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = #imageLiteral(resourceName: "avatar")
        iv.clipsToBounds = true
        iv.layer.masksToBounds = true
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 3
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 75
      
        return iv
    }()
    let setStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.shadowColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    let fullNameLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.text = "Grumpy cat"
        title.textColor = .black
        return title
    }()
    
    let statusLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        title.text = "Waiting for something..."
        title.textColor = .systemGray2
        return title
    }()
    
    let statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false

        textField.backgroundColor = .systemGray6
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.leftView = UIView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 10,
                                                  height: textField.frame.height))
        textField.leftViewMode = .always
        textField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.placeholder = "Set your status..."
        return textField
    }()
    override init(reuseIdentifier: String?) {
            super.init(reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    func setUpView() {
        contentView.addSubview(headerImageView)
        contentView.addSubview(setStatusButton)
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(statusTextField)
        statusTextField.addTarget(self, action: #selector(statusTextFieldDidChange), for: .editingChanged)
      
        let constrains = [
            headerImageView.heightAnchor.constraint(equalToConstant: 150),
            headerImageView.widthAnchor.constraint(equalTo: headerImageView.heightAnchor),
            headerImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
            headerImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            fullNameLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: headerImageView.trailingAnchor, constant: 12),
            fullNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
            
            
            statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            statusTextField.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
           statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            setStatusButton.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
            setStatusButton.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 16),
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor,  constant: 34),
            setStatusButton.leadingAnchor.constraint(equalTo: headerImageView.leadingAnchor),
            setStatusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
           setStatusButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
    ]
        NSLayoutConstraint.activate(constrains)
}
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
    @objc func buttonPressed(_ sender: Any) {
         statusLabel.text = statusTextField.text
     }
    @objc func statusTextFieldDidChange () {
            if statusTextField.text!.isEmpty {
                setStatusButton.isEnabled = false
            }
            else {
                setStatusButton.isEnabled = true
            }

    }
}
    
//    @IBOutlet var imageView: UIImageView! = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleToFill
//        iv.image = UIImage(named: "avatar")
//        iv.clipsToBounds = true
//        iv.layer.masksToBounds = true
//
//        return iv
//    }()
//
//    @IBOutlet var setStatusButton: UIButton! = {
//        let button = UIButton(type: .system)
//        return button
//    }()
//
//    @IBOutlet var fullNameLabel: UILabel! = {
//        let label = UILabel()
//        return label
//    }()
//
//    @IBOutlet private var statusLabel: UILabel! = {
//        let label = UILabel()
//        return label
//    }()
//
//    @IBOutlet var statusTextField: UITextField! = {
//        let textField = UITextField()
//        return textField
//    }()
//
//    override init(frame: CGRect) {
//        super.init (frame: frame)
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//    override func layoutSubviews() {
//
//        imageView.layer.borderColor = UIColor.white.cgColor
//
//        setStatusButton.layer.shadowColor = UIColor.black.cgColor
//
//    }
//    @IBAction func buttonPressed(_ sender: Any) {
//        statusLabel.text = statusTextField.text
//    }
//}
//

