//
//  ListViewController.swift
//  NCMBMemo
//
//  Created by 樋口裕貴 on 2020/04/18.
//  Copyright © 2020 Yuki Higuchi. All rights reserved.
//

import UIKit
import NCMB

class ListViewController: UIViewController , UITableViewDataSource,UITableViewDelegate{
 
    var memoArray = [NCMBObject]()

    @IBOutlet var memoTableView : UITableView!
 
    
        override func viewDidLoad() {
        super.viewDidLoad()
            memoTableView.dataSource = self
            memoTableView.delegate = self
            
            memoTableView.tableFooterView = UIView()
        
                }
   override func viewWillAppear(_ animated: Bool) {
        reloaddata()
    }
            
            
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = memoArray[indexPath.row].object(forKey: "memo") as? String
        return cell

}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //次の画面の取得
        if segue.identifier == "toDetail" {
            let detailViewController = segue.destination as! DetailViewController
            
            let selectedIndex = memoTableView.indexPathForSelectedRow!
            
            
            detailViewController.selectedMemo = memoArray [selectedIndex.row]
            
        }
    }
    
  
        func reloaddata () {
             let query = NCMBQuery(className: "Memo")
                       query?.findObjectsInBackground({ (result, error) in
                           if error != nil{
                               print(error)
                           }else{
                               self.memoArray = result as! [NCMBObject]
                               self.memoTableView.reloadData()
                        }
            })
        }
    
    
    
}
