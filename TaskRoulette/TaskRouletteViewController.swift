//
//  TaskRouletteViewController.swift
//  TaskRoulette
//
//  Created by 山崎ひかり on 2016/03/27.
//  Copyright © 2016年 hikariyamasaki. All rights reserved.
//

import UIKit

class TaskRouletteViewController: UIViewController {
    
    @IBOutlet weak var rouletteView: UIView!
    
    var flag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func start(sender: AnyObject) {
        if flag == 0{
            rouletteView.backgroundColor = UIColor.blackColor()
            flag = 1
            
        }else{

            rouletteView.backgroundColor = UIColor.yellowColor()
            flag = 0
        }
        
    }
    

    @IBAction func backHome(sender: AnyObject) {
       
        
        // UIAlertControllerを作成する.
        let myAlert: UIAlertController = UIAlertController(title: "ホームに戻りますか?", message: "", preferredStyle: .Alert)
        
        // OKのアクションを作成する.
        let myOkAction = UIAlertAction(title: "OK", style: .Default) { action in
            print("Action OK!!")
            // rootViewControllerに戻る
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
        
        let myAction_2 = UIAlertAction(title: "cancel", style: UIAlertActionStyle.Cancel, handler: {
            (action: UIAlertAction!) in
            print("cancel")
        })
        
        // OKのActionを追加する.
        myAlert.addAction(myAction_2)
        myAlert.addAction(myOkAction)
        
        
        // UIAlertを発動する.
        presentViewController(myAlert, animated: true, completion: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
