//
//  ViewController.swift
//  JankenApp00
//
//  Created by 沢井海 on 2021/02/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var YourImage: UIImageView!
    //相手の手
    
    @IBOutlet weak var MySelfImage: UIImageView!
    //自分の手
    
    @IBOutlet weak var JankenponImage: UILabel!
    //三つの選択肢
    
    @IBOutlet weak var JankenponLabel: UILabel!
    //「ジャンケンポン」の文字が表示されるラベル
    
    @IBOutlet weak var ResultLabel: UILabel!
    //ジャンケンの結果が表示されるラベル
    
    var mySelfImageNo = 0
    //mySelfImageNoを0にしておく
    
    var yourImageNo = 0
    //yourImageNoを0にしておく
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "janken_gu")
        //imageという名の定数にUIImageの名前が"janken_gu"の画像を代入する
        
        MySelfImage.image = image
        //自分の手のimageに上記のimageを反映させる
        
        
        let yourImage = UIImage(named: "janken_gu_1")
        //yourImageという名の定数にUIImageの名前が"janken_gu_1"の画像を代入する
        
        YourImage.image = yourImage
        //相手の手のimageに上記のyourImageを反映させる
    }
    
    func changeMySelfImage() {
    //mySelfImageというメソッド
        
        let mySelfImageArray = [
            "janken_gu",
            "janken_choki",
            "janken_pa"
        ]
        //mySelfImageArrayという名前の配列に"janken_gu"、"janken_choki"、"janken_pa"という名をつけた要素を入れる
        
        let name = mySelfImageArray[mySelfImageNo]
        //nameという名の定数にmySelfImageArray配列のmySelfImageNoの数だけ要素を入れる
        
        let image = UIImage(named: name)
        //imageという名の定数にUIImageの、名前が「name」のものを入れる。例えば上記のmySelfImageArrayのjanken_guを入れる
        
        MySelfImage.image = image
        //MySelfImageのimageに上記のimageを反映させる
        
    }
    
    func changeYourImage() {
        
        let janken_gu_1 :UIImage = UIImage(named:"janken_gu_1")!
        //UIImageのjanken_gu_1という名前の画像をjanken_gu_1という名の変数のUIImageに代入する
        
        let janken_choki_1 :UIImage = UIImage(named:"janken_choki_1")!
        //UIImageのjanken_choki_1という名前の画像をjanken_choki_1という名の変数のUIImageに代入する
        
        let janken_pa_1 :UIImage = UIImage(named:"janken_pa_1")!
        //UIImageのjanken_pa_1という名前の画像をjanken_pa_1という名の変数のUIImageに代入する
        
        var yourImageArray: [UIImage] = []
        //yourImageArrayという名の変数にUIImage配列を代入し、空にしておく
        
        yourImageArray = [janken_gu_1,janken_choki_1,janken_pa_1]
        //yourImageArrayにjanken_gu_1、janken_choki_1、janken_pa_1という値を入れる
        
        let ret = Int(arc4random_uniform(3))
        //retという名の定数に3つのランダムな数値を入れる
        
        YourImage.image = yourImageArray[ret]
        //YourImageのimageにyourImageArrayの何かをランダムで表示させる
        
        if ret == 0 {
        //retの数が0の時は
            
            yourImageNo = 0
            //yourImageNoに0を入れる
            
        } else if ret == 1 {
        //そうではなく、retの数が1の時は
            
            yourImageNo = 1
            //yourImageNoに1を入れる
            
        }else {
        //そうでなければ
            
            yourImageNo = 2
            //yourImageNoに2を入れる
            
        }
        
    }
    
    func changeJankenponLabel() {
        
        
        if mySelfImageNo == yourImageNo {
            //MySelfImage.image == YourImage.imageとしていた
            //mySelfImageNoとyourImageNoの数が同じなら
            
            JankenponLabel.text = "あいこで"
            //JankenponLabelのtextに"あいこで"を反映させる
            
        }else {
        //そうでなければ
            
            JankenponLabel.text = "ポンッ！"
            //JankenponLabelのtextに"ポンッ！"を反映させる
            
        }
        
    }
    
    func winOrLose() {
        
        if mySelfImageNo == yourImageNo {
            
            ResultLabel.text = "あいこです"
            
        }else if (mySelfImageNo == 0 && yourImageNo == 2) || (mySelfImageNo == 1 && yourImageNo == 0) || (mySelfImageNo == 2 && yourImageNo == 1) {
            
            ResultLabel.text = "あなたの勝ちです"
        } else {
            ResultLabel.text = "あなたの負けです"
        }
    }
    

    @IBAction func jankenGuButton(_ sender: Any) {
        
        mySelfImageNo = 0
        //mySelfImageNoを0、つまりjanken_guにしておく
        
        changeMySelfImage()
        //上記のmySelfImageメソッドを呼び出す
        
        changeYourImage()
        //上記のyourImageメソッドを呼び出す
        
        changeJankenponLabel()
        //上記のchangeJankenponLabelメソッドを呼び出す
        
        winOrLose()
        
    }
    
    @IBAction func jankenChokiButton(_ sender: Any) {
        
        mySelfImageNo = 1
        //mySelfImageNoを1、つまりjanken_chokiにしておく
        
        changeMySelfImage()
        //上記のメソッドを呼び出す
        
        changeYourImage()
        //上記のyourImageメソッドを呼び出す
        
        changeJankenponLabel()
        //上記のchangeJankenponLabelメソッドを呼び出す
        
        winOrLose()
    
    }
    
        
    
    @IBAction func jankenPaButton(_ sender: Any) {
        
        mySelfImageNo = 2
        //mySelfImageNoを2、つまりjanken_paにしておく
        
        changeMySelfImage()
        //上記のメソッドを呼び出す
        
        changeYourImage()
        //上記のyourImageメソッドを呼び出す
        
        changeJankenponLabel()
        //上記のchangeJankenponLabelメソッドを呼び出す
        
        winOrLose()
        
    }
    
}


