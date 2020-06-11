//
//  CategoryController.swift
//  test_nyt_app
//
//  Created by fedir on 11.06.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class CategoryController: UIViewController {
    
    var categoryArray = [CategoryModel]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setForTable()
        
        self.categoryArray = [CategoryModel(name: "Arts", searchName: "Arts", categoryImage: "nytMark"),
                              CategoryModel(name: "Automobiles", searchName: "Automobiles", categoryImage: "nytMark"),
                              CategoryModel(name: "Business", searchName: "Business", categoryImage: "nytMark"),
                              CategoryModel(name: "Culture", searchName: "Culture", categoryImage: "nytMark"),
                              CategoryModel(name: "Health", searchName: "Health", categoryImage: "nytMark"),
                              CategoryModel(name: "Letters", searchName: "Letters", categoryImage: "nytMark"),
                              CategoryModel(name: "Movies", searchName: "Movies", categoryImage: "nytMark"),
                              CategoryModel(name: "Play", searchName: "Play", categoryImage: "nytMark"),
                              CategoryModel(name: "Style", searchName: "Style", categoryImage: "nytMark")]
        
    }
    fileprivate func setForTable() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellReuseIdentifier: "CategoryCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToArticles" {
            
            //индекс выбранной ячейки
            if let indexPath = tableView.indexPathForSelectedRow  {
                //передача значения для поиска в контроллер
                (segue.destination as? ViewController)?.themeForSearch = categoryArray[indexPath.row].searchName
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        let ctg = categoryArray[indexPath.row]
        cell.setCell(category: ctg)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      performSegue(withIdentifier: "goToArticles", sender: self)
    }
}
