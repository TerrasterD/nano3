//
//  DataBank.swift
//  Viese
//
//  Created by Caio Carvalho de Noronha on 29/07/19.
//  Copyright © 2019 Victor Dângelo. All rights reserved.
//

import Foundation
import SQLite

public class Bank {

    let db: Connection?
    static let instance = Bank()
    
    
    //Tables
    let academies = Table("academies")
    
    //Atributes
    let id = Expression<Int64>("id")
    let name = Expression<String>("name")
    let location = Expression<String>("location")
    
    private init() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        do {
            db = try Connection("\(path)/db.sqlite3")
        } catch {
            db = nil
            print("Unable to open database")
        }
        
        self.createTables()
    }
    
    //Creating a Table
    func createTables() {
        
        do {
            try db?.run(academies.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(name)
                table.column(location)
            })
            
        } catch {
            print("Unable to create the academies table")
        }
    }
    
    //Insert
    func insertAcademies(cname: String, clocation: String) -> Int64? {
        do {
            let insert = academies.insert(name <- cname, location  <- clocation)
            let id = try db!.run(insert)
            return id
            
        }  catch {
            print("Insert Academies Failed")
            return -1
        }
    }
    
    //Select
    func selectAllAcademies() -> [Academy] {
        var academies =  [Academy]()
        
        do {
            for academy in try db!.prepare(self.academies) {
                academies.append(Academy(cid: Int64(academy[id]), cname: academy[name], clocation: academy[location]))
            }
            
        } catch {
            print("Select Academies  Failed!")
        }
        
        return academies
    }
    
    //Delete
    func deleteAcademy(cid: Int64) -> Bool {
        do {
            let academy = academies.filter(id == cid)
            try db!.run(academy.delete())
            return  true
        } catch {
            print("Delete Failed!")
        }
        return false
    }
    
    //Update
    func updateAcademy(cid: Int64, newAcademy: Academy) -> Bool {
        let academy = academies.filter(id == cid)
        do {
            let update = academy.update([name <- newAcademy.name, location <-  newAcademy.location])
            if try db!.run(update)  > 0 {
                return true
            }
        } catch {
            print("Update failed!")
        }
        return false
    }
    
    
    
}
