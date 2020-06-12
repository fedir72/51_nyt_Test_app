//
//  CategoryController.swift
//  test_nyt_app
//
//  Created by fedir on 11.06.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

private struct CategoryConstants {
    static let cellIdentifier = "CategoryCell"
    static let articleIdentidier = "goToArticles"
    static let cellHeight: CGFloat = 105
}

class CategoryController: UIViewController {
    
    var categoryArray = [Category]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setForTable()
        setCategories()
    }
    
    func setCategories() {
        self.categoryArray = [Category(name: "Arts", searchName: "Arts", categoryImage: "arts"),
                              Category(name: "Automobiles", searchName: "Automobiles", categoryImage: "automobiles"),
                              Category(name: "Business", searchName: "Business", categoryImage: "business"),
                              Category(name: "Culture", searchName: "Culture", categoryImage: "culture"),
                              Category(name: "Health", searchName: "Health", categoryImage: "health"),
                              Category(name: "Letters", searchName: "Letters", categoryImage: "letters"),
                              Category(name: "Movies", searchName: "Movies", categoryImage: "movies"),
                              Category(name: "Play", searchName: "Play", categoryImage: "play"),
                              Category(name: "Style", searchName: "Style", categoryImage: "style")]
    }
    
    func setForTable() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: CategoryConstants.cellIdentifier, bundle: nil), forCellReuseIdentifier: CategoryConstants.cellIdentifier)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == CategoryConstants.articleIdentidier {
                //индекс выбранной ячейки
            if let indexPath = tableView.indexPathForSelectedRow  {
                //передача значения для поиска в контроллер
                (segue.destination as? ArticleController)?.category = categoryArray[indexPath.row]
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }

}

extension CategoryController: UITableViewDelegate ,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryConstants.cellIdentifier, for: indexPath) as! CategoryCell
        let ctg = categoryArray[indexPath.row]
        cell.setCell(category: ctg)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CategoryConstants.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: CategoryConstants.articleIdentidier, sender: self)
    }
}
