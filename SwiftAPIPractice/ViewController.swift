//
//  ViewController.swift
//  SwiftAPIPractice
//
//  Created by KentoFujita on 2023/04/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var articles: [[String: Any]] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //API処理
        let url: URL = URL(string: "http://qiita.com/api/v2/items")!
        let task: URLSessionTask  = URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [Any]
                let articles = json.map { (article) -> [String: Any] in
                    return article as! [String: Any]
                }
                DispatchQueue.main.async() { () -> Void in
                    self.articles = articles
                }
            }
            catch {
                print(error)
            }
        })
        task.resume()

        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
    }

}

extension ViewController: UITableViewDataSource {

    // セクションの個数を返す
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // セクションごとにセルの個数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    // セルの中身を返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let article = articles[indexPath.row]
                let title = article["title"] as! String
                cell.bindData(text: "title: \(title)")
                return cell
    }

    // セルの高さを返す
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension ViewController: UITableViewDelegate {

    // セルがタップされたときの処理を書く
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }

    // スクロールしたときの処理を書く
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        return
    }
}
