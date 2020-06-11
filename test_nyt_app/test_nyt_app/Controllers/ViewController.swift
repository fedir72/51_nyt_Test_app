//
//  ViewController.swift
//  test_nyt_app
//
//  Created by fedir on 09.06.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit
import SafariServices


class ViewController: UIViewController {
    
    var themeForSearch: String?
    
    var articles = [Doc]()
    
   

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setForTable()
       print("themeForSearch:", themeForSearch!)
        //MARK: - вызов загрузки данных
        NetworkManager.shared.getdArticles(theme: self.themeForSearch ?? "Health") { (model) in
            self.articles = model!.response!.docs!
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    fileprivate func setForTable() {
        tableView.delegate = self
              tableView.dataSource = self
              tableView.register(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: "ArticleCell")
              
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        let artcl = articles[indexPath.row]
        cell.setData(doc: artcl)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 159
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let artcl = articles[indexPath.row]
        if let url = URL(string: artcl.web_url! ) {
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }
    }
}

