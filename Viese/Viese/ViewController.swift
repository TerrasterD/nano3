//
//  ViewController.swift
//  Viese
//
//  Created by Victor Dângelo Teixeira Ciccarini on 18/07/19.
//  Copyright © 2019 Victor Dângelo. All rights reserved.
//

import UIKit
import Alamofire
import SpriteKit
class ViewController: UIViewController {
    
    var caivis : String = "Caio gato"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        chamaGatao()
        
        // Do any additional setup after loading the view.
    }
    
    func chamaGatao() {
        print(caivis)
    }


}

