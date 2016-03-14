//
//  ViewController.swift
//  The Trivia Game
//
//  Created by Bruno Soares da Silva on 3/14/16.
//  Copyright © 2016 Bruno Soares da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var start_btn: UIButton!
    @IBOutlet weak var title_lb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title_lb?.font = UIFont(name: "3dumb", size: 16)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

