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
    
    var calisanlar :Results<CalisanlarModel>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        segmentedControl.addTarget(self, action: #selector(segmentChanged) , for: .valueChanged)
        predicateCalisanlar(role: "")
        tableView.reloadData()


        tableView.delegate   = self
        tableView.dataSource = self
    }
    
    @objc func segmentChanged(){
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            predicateCalisanlar(role: "")
        case 1:
            predicateCalisanlar(role: "Swift")
        case 2:
            predicateCalisanlar(role: "Android")
        case 3:
            predicateCalisanlar(role: "Designer")

        default:
            predicateCalisanlar(role: "")
        }
    }
    
    func predicateCalisanlar(role:String){
        
        let realm = try! Realm()
        if role == ""{
            calisanlar = realm.objects(CalisanlarModel.self)
        }else{
            calisanlar = realm.objects(CalisanlarModel.self).filter("role = %@", role)

        }
        
        tableView.reloadData()
    }
    
    func callRealm() {
        
        do {
            let realm = try Realm()
            
            tableView.reloadData()

        } catch {
            
        }
    }

}
extension CalisanlarViewController :UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calisanlar == nil ? 0 : calisanlar!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if calisanlar != nil {
            cell.textLabel?.text = calisanlar![indexPath.row].name

        }

        return cell
        
    }
    
    
}
