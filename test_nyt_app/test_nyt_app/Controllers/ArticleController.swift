//
//  ArticleController.swift
//  test_nyt_app
//
//  Created by fedir on 09.06.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit
import SafariServices


private struct ArticleConstants {
    static let cellIdentifier = "ArticleCell"
    static let cellHeight: CGFloat = 132
}


class ArticleController: UIViewController {
    
    var category: Category?
    var articles = [Doc]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setForTable()
        loadArticle()
    }
    
    func setForTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: ArticleConstants.cellIdentifier, bundle: nil), forCellReuseIdentifier: ArticleConstants.cellIdentifier)
    }
    
    // MARK: - Helpers
    
    func loadArticle() {
        
        guard let ctg = self.category else { return }
        
        NetworkManager.shared.getdArticles(categoryName: ctg.searchName) { (offer) in
            
            guard let docs = offer?.response?.docs else { return }
            
            self.articles = docs
            self.tableView.reloadData()
        }
    }
    
    func showArticleDetails(with article: Doc) {
        
        guard let webUrl = article.web_url, let url = URL(string: webUrl) else { return }
        
        let svc = SFSafariViewController(url: url)
        present(svc, animated: true, completion: nil)
    }

}

extension ArticleController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleConstants.cellIdentifier, for: indexPath) as! ArticleCell
        let artc = articles[indexPath.row]
        cell.setData(doc: artc)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  ArticleConstants.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let artc = articles[indexPath.row]
        self.showArticleDetails(with: artc)
    }
}

