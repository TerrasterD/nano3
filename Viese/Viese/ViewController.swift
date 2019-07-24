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
    
    var caivis : String = "Caio gado"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        chamaGadao()
        
        // Do any additional setup after loading the view.
    }
    
    func chamaGadao() {
        print(caivis)
    }


}

