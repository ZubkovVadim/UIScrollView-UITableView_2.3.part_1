import UIKit
import StorageService

class ProfileViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .plain)
    let cellIDPosts = "CellIDPosts"
    let cellIDPhotos = "CellIDPhotos"
    let allPosts = Storage.posts
    let photos = PhotosStorage.photos
    
    override func viewDidLoad() {
        setUpTableView()
    }
    
    func setUpTableView() {
        view.addSubview(tableView)
//        view.backgroundColor = .systemGray5
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellIDPosts)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: cellIDPhotos)
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
         
        #if Copy
        view.backgroundColor = .systemPink
        #else
        view.backgroundColor = .blue
        #endif
//        var preferredStatusBarStyle: UIStatusBarStyle {.darkContent}
//        var prefersStatusBarHidden: Bool {false}
        
        
        let constraints = [
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
//    override func viewWillDisappear (_ animated: Bool) {
//    super.viewWillDisappear(animated)
//        UIApplication.shared.statusBarStyle = UIStatusBarStyle.darkContent
//    }
}
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIDPosts) as! PostTableViewCell
            cell.post = allPosts[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIDPhotos) as! PhotosTableViewCell
            cell.photo = Array(photos.prefix(4))
            cell.openPhotosViewController = {[weak self] in
                let vc = PhotosViewController()
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            return cell
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return allPosts.count
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
}

extension ProfileViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = ProfileHeaderView()
            return header
        } else {
            return nil
        }
    }
}


//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let post = Storage.tableModel[indexPath.section].posts[indexPath.row]
//
//        (cell as! PostTableViewCell).post = post
//    }





