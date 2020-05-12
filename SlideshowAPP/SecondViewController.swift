//
//  SecondViewController.swift
//  SlideshowAPP
//
//  Created by 松本脩平 on 2020/05/10.
//  Copyright © 2020 松本脩平. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var image: UIImage?

    @IBOutlet weak var picture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picture.image = image
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
