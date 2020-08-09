//
//  AddViewController.swift
//  NCMBMemo
//
//  Created by 樋口裕貴 on 2020/04/18.
//  Copyright © 2020 Yuki Higuchi. All rights reserved.
//

import UIKit
import NCMB

class AddViewController: UIViewController {
    
    @IBOutlet var memoTextView : UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        memoTextView.becomeFirstResponder()
    }
    
    @IBAction func save(){
    
    let object = NCMBObject(className: "Memo")
        object?.setObject(memoTextView.text, forKey: "memo")
        object?.saveInBackground({ (error) in
            if error != nil{
                print(error)
            }else{
                let alertController = UIAlertController(title: "保存完了", message: "保存が完了しました。元の画面に戻ります。", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default) { (action) in
                    self.navigationController?.popViewController(animated: true)
                }
                alertController.addAction(action)
                self.present(alertController, animated: true, completion: nil)
            }
        })
    

    }
}
