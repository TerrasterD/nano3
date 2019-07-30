//
//  Students.swift
//  Viese
//
//  Created by Igor de Castro on 29/07/19.
//  Copyright © 2019 Victor Dângelo. All rights reserved.
//

import Foundation
import UIKit

public class Student{
    let id: Int64
    let name: String
    let serieNumber: Int
    let academyId: Int64
    let office: String
    
    init(cid: Int64, cname: String, cserieNumber: Int, cacademuyId: Int64, coffice: String){
        id = cid
        name = cname
        serieNumber = cserieNumber
        academyId = cacademuyId
        office = coffice
    }
    
}
