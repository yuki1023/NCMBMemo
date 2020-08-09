//
//  DetailViewController.swift
//  NCMBMemo
//
//  Created by 樋口裕貴 on 2020/04/18.
//  Copyright © 2020 Yuki Higuchi. All rights reserved.
//

import UIKit
import NCMB
import SVProgressHUD

class DetailViewController: UIViewController {
    
    var selectedMemo : NCMBObject!
    
    
    @IBOutlet var memoTextView : UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoTextView.text = selectedMemo.object(forKey: "memo") as! String

  
    }
    
    @IBAction func update () {
        selectedMemo.setObject(memoTextView.text, forKey: "memo")
        selectedMemo.saveInBackground { (error) in
            if error != nil{
                print(error)
                SVProgressHUD.showError(withStatus: error?.localizedDescription)
            }else{
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func delete() {
        selectedMemo.deleteInBackground { (error) in
            if error != nil{
                print(error)
                SVProgressHUD.showError(withStatus: error?.localizedDescription)
            }else{
                self.navigationController?.popViewController(animated: true)
            }
        }
    }

    

}
