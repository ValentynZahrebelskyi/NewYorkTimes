//
//  MostViewedTableViewController.swift
//  NYTimes
//
//  Created by Загребельский Валентин on 18.07.2020.
//  Copyright © 2020 Загребельский Валентин. All rights reserved.
//

import UIKit
import SafariServices

class MostViewedTableViewController: UIViewController {

    var tempDownload = [ArticleModel]()

    @IBOutlet weak var tableView: UITableView!

    override func viewWillAppear(_ animated: Bool) {
        NetworkServiseManager().alamo(source: mostViewedUrlString) { (model) in
            self.tempDownload = model.results
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        NetworkServiseManager().alamo(source: mostViewedUrlString) { (model) in
            self.tempDownload = model.results
        }
        tableView.reloadData()

    }
}



extension MostViewedTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        NetworkServiseManager().alamo(source: mostViewedUrlString) { (model) in
            cell.textLabel?.text = model.results[indexPath.row].title
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return counter[mostViewedUrlString]!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = NetworkServiseManager().alamo(source: mostViewedUrlString, { (model) in
            let vc = SFSafariViewController(url: (URLComponents(string: model.results[indexPath.row].url)?.url)!)
            self.present(vc, animated: true)
        })
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let add = UITableViewRowAction(style: .normal, title: "Add") { (action, indexPath) in
            CoreDataManager().saveData(self.tempDownload[indexPath.row])
            let alert = UIAlertController(title: "Done", message: "Successed  adding", preferredStyle: .alert)
            self.present(alert, animated: true)
            let when = DispatchTime.now() + 2
            DispatchQueue.main.asyncAfter(deadline: when) {
                alert.dismiss(animated: true, completion: nil)
            }
        }

        add.backgroundColor = UIColor.green
            return [add]
    }
}
