//
//  Academies.swift
//  Viese
//
//  Created by Igor de Castro on 29/07/19.
//  Copyright © 2019 Victor Dângelo. All rights reserved.
//

import Foundation
import UIKit

public class Academy {
    let id : Int64
    let name : String
    let location : String
    
    init(cid: Int64, cname: String, clocation: String){
        id = cid
        name = cname
        location = clocation
    }
    
}
