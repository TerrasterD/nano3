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
import UnityAds

class ViewController: UIViewController {
    
    var caivis : String = "Caio GATISSIMO"
    var igot :  String = "Eu moro em baixo da ponte"
    var vitu : String = "Vou levar minha irmā"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        chamaGadao()
        
        // Do any additional setup after loading the view.
    }
    
    func chamaGadao() {
        print(caivis)
    }
    
    func chamaIgot() {
        print(igot)
    }
    
    func chamaDangel() {
        print(vitu)
    }


}

