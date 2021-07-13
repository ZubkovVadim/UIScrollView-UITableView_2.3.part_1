import UIKit

class ProfileViewController: UIViewController {
        lazy var buttonNew: UIButton! = {
            let button = UIButton(type: .system)
            button.setTitle("New title", for: .normal)
            return button
        }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        view.addSubview(buttonNew)
        buttonNew.backgroundColor = .green
        buttonNew.translatesAutoresizingMaskIntoConstraints = false
        buttonNew.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        buttonNew.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        buttonNew.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        
    }
}
