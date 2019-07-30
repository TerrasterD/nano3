//
//  Student.swift
//  Viese
//
//  Created by Victor Dângelo Teixeira Ciccarini on 29/07/19.
//  Copyright © 2019 Victor Dângelo. All rights reserved.
//

import Foundation
import UIKit

public class Student{
    let id: Int64
    let serieNumber: Int
    let name: String
    let academyId: Int
    let office: String
    init(xId: Int64, xName: String, xAcademyId: Int, xSerieNumber: Int, xOffice: String){
        id = xId
        name = xName
        serieNumber = xSerieNumber
        academyId = xAcademyId
        office = xOffice
    }
}
