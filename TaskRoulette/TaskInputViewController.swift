//
//  TaskInputViewController.swift
//  TaskRoulette
//
//  Created by 山崎ひかり on 2016/03/27.
//  Copyright © 2016年 hikariyamasaki. All rights reserved.

import UIKit

class TaskInputViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , InputTextTableCellDelegate{
    
    // Tableで使用する配列を設定する
    private let myItems: NSArray = ["1.仕事1", "2.仕事2", "3.仕事3"]
    //private var myTableView: UITableView!
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        // Status Barの高さを取得する.
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        
        // Viewの高さと幅を取得する.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // TableViewの生成する(status barの高さ分ずらして表示).
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        */
        
        // 入力していたデータを空にする.
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.tasks = []

        
        
        

        // DataSourceの設定をする.
        myTableView.dataSource = self
        
        // Delegateを設定する.
        myTableView.delegate = self
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
}

    /*
    Cellが選択された際に呼び出されるデリゲートメソッド.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myItems[indexPath.row])")
    }
    
    /*
    Cellの総数を返すデータソースメソッド.
    (実装必須)
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
    }
    
    /*
    Cellに値を設定するデータソースメソッド.
    (実装必須)
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("InputTextCell", forIndexPath: indexPath) as! InputTextTableCell
        
        // delegate設定
        cell.delegate = self
        
        return cell
    }
    
    // 追加
    // MARK: - InputTextTableCellDelegate
    func textFieldDidEndEditing(cell: InputTextTableCell, value: NSString) -> () {
        let path = myTableView.indexPathForRowAtPoint(cell.convertPoint(cell.bounds.origin, toView: myTableView))
        // 入力されたデータをルーレットに渡すために、AppDelegateにデータを渡す.
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.tasks.append(value as String)

        print("row = \(path!.row), value = \(value)")
    }
    
    // MARK: - UITableViewDelegate
    /*func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return InputTextTableCell.height()
    }*/
    
}