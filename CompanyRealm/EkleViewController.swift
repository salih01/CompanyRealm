//
//  EkleViewController.swift
//  CompanyRealm
//
//  Created by Salih on 4.03.2023.
//

import UIKit
import RealmSwift

class EkleViewController: UIViewController {

    @IBOutlet weak var rollPickerView: UIPickerView!
    @IBOutlet weak var nameTextField: UITextField!
    
    let roll = ["Swift","Android","Designer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rollPickerView.dataSource = self
        rollPickerView.delegate   = self
        
    }
    

    @IBAction func addTapped(_ sender: Any) {
        
        var calisan = CalisanlarModel()
        calisan.name = nameTextField.text!
        calisan.role = roll[rollPickerView.selectedRow(inComponent: 0)]
        
        do {
            let realm = try Realm()
           try realm.write {
               realm.add(calisan)
            }
        }catch{
            print(error.localizedDescription)
        }
        
        
    }
    
}

extension EkleViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return roll.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return roll[row]
    }
    
    
}
