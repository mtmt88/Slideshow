//
//  ViewController.swift
//  SlideshowAPP
//
//  Created by 松本脩平 on 2020/04/26.
//  Copyright © 2020 松本脩平. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /// 表示している画像の番号
    var dispImageNo = 0
    // 画像の名前の配列
    let imageNameArray = [
        "slot_star",
        "slot_bell",
        "slot_crover",
    ]
    //タイマー
    var timer: Timer!
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    //画像
    @IBOutlet weak var picture: UIImageView!
    //ボタン
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var startStopButton: UIButton!
    
    @IBAction func tapAction(_ sender: Any) {
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
        
        //タイマー起動中に画面遷移をした場合
        if self.timer != nil {
          // タイマーを停止
          self.timer.invalidate()
          // nil にして再び再生(nil の時にタイマー生成)
          self.timer = nil
        
          // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ表示
          nextButton.isEnabled = true
          backButton.isEnabled = true
        }

        //タイトルを再生に戻す
        startStopButton.setTitle("再生", for: .normal)
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    //進むボタン
    @IBAction func next(_ sender: Any) {
        // 表示している画像の番号を1増やす
        dispImageNo += 1

        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    //戻るボタン
    @IBAction func back(_ sender: Any) {
        // 表示している画像の番号を1減らす
        dispImageNo -= 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
            
    //再生・停止ボタン
    @IBAction func startStop(_ sender: Any) {
       
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            // タイマーを設定
            self.timer = Timer.scheduledTimer(timeInterval: 2.0,
            target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
            nextButton.isEnabled = false
            backButton.isEnabled = false
            
            //タイトルを停止に変更
            startStopButton.setTitle("停止", for: .normal)
            
        } else if self.timer != nil {
            // タイマーを停止
            self.timer.invalidate()
            // nil にして再び再生(nil の時にタイマー生成)
            self.timer = nil
            // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ表示
            nextButton.isEnabled = true
            backButton.isEnabled = true

            //タイトルを再生に戻す
            startStopButton.setTitle("再生", for: .normal)
        }
    }

    // #selectorで呼び出される関数
    @objc func updateTimer(_ timer: Timer) {
        // 進むボタンの内容を行う
        if dispImageNo < imageNameArray.count - 1 {
            // 表示している画像の番号を1増やす
            dispImageNo += 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
        } else {
            dispImageNo = 0
            displayImage()
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picture.image = UIImage(named: "slot_star")
        
        // Do any additional setup after loading the view.
    }


    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
    // 画像の番号が正常な範囲を指しているかチェック
            // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }

        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
           dispImageNo = 0
        }

        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        picture.image = image
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let secondViewController = segue.destination as! SecondViewController
        // 遷移先のResultViewControllerで宣言している値を代入して渡す
        secondViewController.image = picture.image
        
    }

}

