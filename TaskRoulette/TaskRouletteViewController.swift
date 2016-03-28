//
//  TaskRouletteViewController.swift
//  TaskRoulette
//
//  Created by 山崎ひかり on 2016/03/27.
//  Copyright © 2016年 hikariyamasaki. All rights reserved.
//

import UIKit

class TaskRouletteViewController: UIViewController {
    
    let sepa = 6
    var rouletteView:UIView!
    var bgRouletteView:UIView!
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        
        bgRouletteView = RouletteView(frame: CGRectMake(0,0,width * 0.8,width * 0.8))
        bgRouletteView.center = CGPointMake(width / 2, height / 2)
        bgRouletteView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        bgRouletteView.tag = 1
        
        let bgwidth = bgRouletteView.frame.width
        
        rouletteView = RouletteView(frame: CGRectMake(0,0,bgwidth * 0.6,bgwidth * 0.6))
        rouletteView.center = CGPointMake(bgwidth / 2, bgwidth / 2)
        rouletteView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        
        // viewの貼り付け
        bgRouletteView.addSubview(rouletteView)
        self.view.addSubview(bgRouletteView)
       
        
             
        // ルーレットの初期化
        initRoulette(sepa)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func start(sender: AnyObject) {
        
        // 回転アニメーション.
        // 初期化.
        //self.rouletteView.transform = CGAffineTransformMakeRotation(0)
        
        // 回転数をランダムにするところ
        let n = Int(arc4random()) % sepa + 1
        /*for i in 1..<(5 + n){
            
            // radianで回転角度を指定(90度).
            let angle:CGFloat = CGFloat(2 * M_PI / Double(sepa) * Double(i))

            // アニメーションの秒数を設定(0.5秒).
            UIView.animateWithDuration(2.0,
                
                animations: { () -> Void in
                    
                    // 回転用のアフィン行列を生成.
                    self.rouletteView.transform = CGAffineTransformMakeRotation(angle)
                },
                completion: { (Bool) -> Void in
            })
            
        }*/
        
        
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = 2 * M_PI / Double(sepa)
        animation.duration = 0.2 // 0.5秒でtoValue度回転
        animation.repeatCount = Float(20 + n)   // 回数だけ繰り返す
        //animation.cumulative = true         // 効果を累積
        
        // アニメーションの実行
        rouletteView.layer.addAnimation(animation, forKey: "Routation")
        
        
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

    
    func initRoulette(sepa:Int){
        
        // 1.ルーレットの円
        // layerに cornerRadiusを指定し、円にする。
        //self.rouletteView.layer.cornerRadius = self.rouletteView.frame.size.width / 2.0
        //self.rouletteView.backgroundColor = UIColor.lightGrayColor()
        
        
        // 2.数字を配置
        let Max = Double(sepa)
        let angle = 2 * M_PI / Max
        
        let r = self.rouletteView.frame.size.width * 0.4
        
        for i in 0 ..< Int(Max) {
            let x = r * CGFloat(cos(Double(i) * angle)) + self.rouletteView.frame.size.width / 2.0
            let y = r * CGFloat(sin(Double(i) * angle)) + self.rouletteView.frame.size.height / 2.0
            
            let number = UILabel(frame: CGRectMake(0, 0, 40, 40))
            number.backgroundColor = UIColor.whiteColor()
            number.text = "\(i + 1)"
            
            // number.sizeToFit()
            number.layer.cornerRadius = number.frame.size.width / 2.0
            number.center = CGPointMake(x, y)
            
            // for ios5 and ios6
            // NSTextAlignmentCenter, UITextAlignmentCenter
            //number.textAlignment = 1
            
            // 斜めに
            let transform:CGAffineTransform = CGAffineTransformMakeRotation(CGFloat(Double(i) * angle + M_PI_2))
            number.transform = transform
            
            self.rouletteView.addSubview(number)
            
        }
        
    }
}



