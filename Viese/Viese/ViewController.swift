//
//  ViewController.swift
//  Viese
//
//  Created by Victor Dângelo Teixeira Ciccarini on 18/07/19.
//  Copyright © 2019 Victor Dângelo. All rights reserved.
//

import UIKit
import Alamofire
import SQLite

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var academyName: UITextField!
    @IBOutlet weak var academyLocation: UITextField!
    @IBOutlet weak var academiesTableView: UITableView!
    var academy = Bank.instance.selectAllAcademies()
    var academySelecionada : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func salvar(_ sender: Any) {
        
        if let name = academyName.text  {
            if let location = academyLocation.text {
                let academyModificada = Academy(cid: academy[academySelecionada!].id!, cname: name, clocation: location)
                Bank.instance.updateAcademy(cid: academy[academySelecionada!].id!, newAcademy: academyModificada)
                academy = Bank.instance.selectAllAcademies()
                
                academiesTableView.reloadData()
                academiesTableView.reloadRows(at: [NSIndexPath(row: academySelecionada!, section: 0) as IndexPath], with: .fade)
            }
        }
    }
    
    @IBAction func adicionar(_ sender: Any) {
        
        guard let name = academyName.text else {
            return
        }
        guard let location = academyLocation.text else {
            return
        }
        guard let academyId = Bank.instance.insertAcademies(cname: name, clocation: location) else {
            return
        }
    
    academy.append(Academy.init(cid: academyId, cname: name, clocation: location))
    academiesTableView.insertRows(at: [NSIndexPath(row: academy.count - 1, section: 0) as IndexPath], with: .fade)
    }
    
    
    @IBAction func excluir(_ sender: Any) {
        
        guard let row = academySelecionada else {
            return
        }
        
        Bank.instance.deleteAcademy(cid: (academy[row].id!))
        academy.remove(at: row)
        academiesTableView.deleteRows(at: [NSIndexPath(row: row, section: 0) as IndexPath], with: .fade)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        academySelecionada = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return academy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        
        cell.name.text = academy[indexPath.row].name
        cell.location.text = academy[indexPath.row].location
        
        return cell
    }
    
    
}
