//
//  DataBank.swift
//  Viese
//
//  Created by Victor Dângelo Teixeira Ciccarini on 29/07/19.
//  Copyright © 2019 Victor Dângelo. All rights reserved.
//

import Foundation
import SQLite

public class Banco {
    let db: Connection?
    static let instance = Banco()
    
    let academies = Table("academies")
    let students = Table("students")
    
    let id = Expression<Int64>("id")
    let name = Expression<String>("name")
    let serieNumber = Expression<Int>("serie_number")
    let academyId = Expression<Int>("academy_id")
    let location = Expression<String>("location")
    let office = Expression<String>("office")
    
    private init() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        do{
            db = try Connection("\(path)/db.sqlite")
        }catch{
            db = nil
            print("Unable to open database")
        }
    }
    
    func createTables() {
        do {
            try db!.run(academies.create(ifNotExists: true) {table in
                table.column(id, primaryKey: true)
                table.column(name)
                table.column(location)
            })
        }catch{
            print("Unable to acess the table")
        }
        
        do {
            try db!.run(students.create(ifNotExists: true) {table in
                table.column(id, primaryKey: true)
                table.column(name)
                table.column(serieNumber)
                table.column(academyId)
                table.column(office)
            })
        }catch{
            print("Unable to acess the table")
        }
    }
    
    func insertAcademies(xName: String, xLocation: String) -> Int64{
        let insert = academies.insert(name <- xName, location <- xLocation)
        do {
            let id = try db!.run(insert)
            return id
        }catch{
            print("Unable to acess the table")
            return -1
        }
    }
    
    func insertStudents(xName: String, xSerieNumber: Int, xAcademyId: Int, xOffice: String) -> Int64{
        let insert = students.insert(name <- xName, serieNumber <- xSerieNumber, academyId <- xAcademyId, office <- xOffice)
        do {
            let id = try db!.run(insert)
            return id
        }catch{
            print("Unable to acess the table")
            return -1
        }
    }
    
    func selectAllAcademies() -> [Academy]{
        var academies = [Academy]()
        
        do {
            for academy in try db!.prepare(self.academies){
                academies.append(Academy(xId: Int64(academy[id]), xName: academy[name], xLocation: academy[location]))
            }
        } catch{
            print("Unable to acess the table")
        }
        return academies
    }
    
    func deleteAcademy(xId: Int64) -> Bool {
        do {
            let academy = academies.filter(id == xId)
            try db!.run(academy.delete())
            return true
        }catch{
            print("Delete failed")
            return false
        }
    }
    
    func updateAcademy(xId: Int64, newAcademy: Academy) -> Bool {
        do {
            let academy = academies.filter(id == xId)
            let update = academy.update(name <- newAcademy.name, location <- newAcademy.location)
            try db!.run(update)
            return true
        }catch{
            print("Update failed")
            return false
        }
    }
}
