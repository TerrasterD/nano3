//
//  DataBank.swift
//  Viese
//
<<<<<<< HEAD
//  Created by Victor Dângelo Teixeira Ciccarini on 29/07/19.
=======
//  Created by Caio Carvalho de Noronha on 29/07/19.
>>>>>>> 5109444516ac57b000d4e22ba056203c02c96023
//  Copyright © 2019 Victor Dângelo. All rights reserved.
//

import Foundation
import SQLite

<<<<<<< HEAD
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
=======
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
>>>>>>> 5109444516ac57b000d4e22ba056203c02c96023
            return -1
        }
    }
    
<<<<<<< HEAD
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
=======
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
    
    
    
>>>>>>> 5109444516ac57b000d4e22ba056203c02c96023
}
