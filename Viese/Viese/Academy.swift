//
<<<<<<< HEAD
//  Academy.swift
//  Viese
//
//  Created by Victor Dângelo Teixeira Ciccarini on 29/07/19.
=======
//  Academies.swift
//  Viese
//
//  Created by Caio Carvalho de Noronha on 29/07/19.
>>>>>>> 5109444516ac57b000d4e22ba056203c02c96023
//  Copyright © 2019 Victor Dângelo. All rights reserved.
//

import Foundation
import UIKit

<<<<<<< HEAD
public class Academy{
    let id: Int64
    let name: String
    let location: String
    init(xId: Int64, xName: String, xLocation: String){
        id = xId
        name = xName
        location = xLocation
=======
public class Academy {
    let id : Int64?
    let name : String
    let location : String
    
    init(cid: Int64, cname: String, clocation: String) {
        id = cid
        name = cname
        location = clocation
    }
    
    init(cid : Int64) {
        id = cid
        name = ""
        location = ""
>>>>>>> 5109444516ac57b000d4e22ba056203c02c96023
    }
}
