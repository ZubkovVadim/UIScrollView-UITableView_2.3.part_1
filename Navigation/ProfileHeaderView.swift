import UIKit

class ProfileHeaderView: UIView {
    
    
    @IBOutlet var imageView: UIImageView! = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage(named: "avatar")
        iv.clipsToBounds = true
        iv.layer.masksToBounds = true

        return iv
    }()
    
    @IBOutlet var setStatusButton: UIButton! = {
        let button = UIButton(type: .system)
        return button
    }()
    
    @IBOutlet var fullNameLabel: UILabel! = {
        let label = UILabel()
        return label
    }()
    
    @IBOutlet private var statusLabel: UILabel! = {
        let label = UILabel()
        return label
    }()
    
    @IBOutlet var statusTextField: UITextField! = {
        let textField = UITextField()
        return textField
    }()

    override init(frame: CGRect) {
        super.init (frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func layoutSubviews() {
        
        imageView.layer.borderColor = UIColor.white.cgColor
        
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        
    }
    @IBAction func buttonPressed(_ sender: Any) {
        statusLabel.text = statusTextField.text
    }
}

