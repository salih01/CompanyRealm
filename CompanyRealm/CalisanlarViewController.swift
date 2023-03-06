//
//  CalisanlarViewController.swift
//  CompanyRealm
//
//  Created by Salih on 4.03.2023.
//

import UIKit
import RealmSwift

class CalisanlarViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var calisanlar = [CalisanlarModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callRealm()
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        tableView.delegate   = self
        tableView.dataSource = self
    }
    
    
    func callRealm() {
        
        do {
            let realm = try Realm()
            
          let data = realm.object(ofType: CalisanlarModel.self, forPrimaryKey: "ED13EA0E-EE54-4238-BC85-ECD57BDA403D")
            if let data = data {
                calisanlar.append(data)
                tableView.reloadData()
            }

        } catch {
            
        }
    }

}
extension CalisanlarViewController :UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calisanlar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = calisanlar[indexPath.row].name

        return cell
        
    }
    
    
}
