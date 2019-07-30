//
//  DataBank.swift
//  Viese
//
//  Created by Igor de Castro on 29/07/19.
//  Copyright © 2019 Victor Dângelo. All rights reserved.
//

import Foundation
import SQLite

public class Banco {
    let db: Connection?
    static let insgtance = Banco()
    
    //Tables
    let academies = Table("academies")
    let students = Table("students")
    //
    let id = Expression<Int64>("id")
    let name = Expression<String>("nome")
    let location = Expression<String>("location")
    let serieNumber = Expression<Int>("serie number")
    let academyId = Expression<Int64>("id academy")
    let office = Expression<String>("office")
    //Atributes
    
    private init() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        do {
            db = try Connection("\(path)/db.sqlite3")
        } catch {
            db = nil
            print("Unable to open  database")
        }
    }
    
    func createTable() {
        do {
            try db!.run(academies.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(name)
                table.column(location)
            })
        } catch {
            print("Unable to crate a table")
        }
        do {
            try db!.run(students.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(name)
                table.column(serieNumber)
                table.column(academyId)
                table.column(office)
            })
        } catch {
            print("Unable to crate a table")
        }
        
    }
    func insertAcademies(cname: String, clocation: String) -> Int64 {
        do {
            let insert = academies.insert(name <- cname, location <- clocation)
            let id = try db!.run(insert)
            return id
        } catch {
            print("Insert Academie Failed")
            
            return -1
        }
    }
    func insertStudent(cname: String, cSerieNumber: Int, coffice: String) -> Int64 {
        do{
            let insert = students.insert(name <- cname, serieNumber <- cSerieNumber, office <- coffice)
            let id = try db!.run(insert)
            return id
            
        } catch {
            print("Insert Academie Failed")
            
            return -1
        }
    }
    
    func selectAcademies() -> [Academy] {
        var academies = [Academy]()
        
        do {
            for academy in try db!.prepare(self.academies) {
                academies.append(Academy(cid: Int64(academy[id]), cname: academy[name], clocation: academy[location]))
            }
            
        } catch {
            print("Select Academie Failed")
        }
        return academies
    }
    
    //Delete
    func deleteAcademy(cid: Int64) -> Bool {
        do {
            let academy = academies.filter(id == cid)
            try db!.run(academy.delete())
            return true
        } catch {
            print("Delete Failed!")
        }
        return false
    }
    
    //Update
    func updateAcademy(cid: Int64, newAcademy: Academy) -> Bool {
        let academy = academies.filter(id == cid)
        let update = academy.update([name <- newAcademy.name, location <- newAcademy.location])
        
        do{
            if try db!.run(update) > 0 {
                return true
            }
        } catch {
            print("Update failed!")
            
        }
        return false
    }
}
