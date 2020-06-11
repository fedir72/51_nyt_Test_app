//
//  ViewController.swift
//  test_nyt_app
//
//  Created by fedir on 09.06.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

//https://api.nytimes.com/svc/search/v2/articlesearch.json?q=election&api-key=LucVQN80Hcs1DWf37dMmFc2XtpHfZovV
class ViewController: UIViewController {
    
    var articles = [Doc]()
    //var network = NetworkManager()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setForTable()
        
        //MARK: - вызов загрузки данных
        NetworkManager.shared.getdArticles(theme: "Sports") { (model) in
            for i in model!.response!.docs! {
                print("Main: ",i.headline?.main!)
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
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 159
    }
    
}

extension ViewController {
//    fileprivate func getData() {
//        let str = "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=Health&api-key=LucVQN80Hcs1DWf37dMmFc2XtpHfZovV"
//        if let url = URL(string: str) {
//        let session = URLSession.shared
//        session.dataTask(with: url) { (data, responce, error) in
//            guard data != nil else {return}
//            let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
//
//            guard rootDictionaryAny != nil else {return}
//                        //print("root",rootDictionaryAny!)
//
//            if let array = rootDictionaryAny!["response"]  {
//                let arrDocs = array as! [String:Any]
//                let docs = arrDocs["docs"]
//                print("docs: ",docs)
//
//            }
//
//
//
//
//            }.resume()
//
//        }
//}
}
