//
//  FavoritesTableViewController.swift
//  NYTimes
//
//  Created by Загребельский Валентин on 18.07.2020.
//  Copyright © 2020 Загребельский Валентин. All rights reserved.
//

import UIKit
import SafariServices

class FavoritesTableViewController: UIViewController {

    var tempMemory = [Article]()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewWillAppear(_ animated: Bool) {
        CoreDataManager().fetchData(&tempMemory)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self        
    }
}



extension FavoritesTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tempMemory[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempMemory.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.setEditing(true, animated: true)
        if editingStyle == UITableViewCell.EditingStyle.delete {
            CoreDataManager().deleteData(&tempMemory, element: tempMemory[indexPath.row])
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "webVC") as! WebPageViewController
        vc.currentArticle = tempMemory[indexPath.row]
        present(vc,animated: true)
    }
}
