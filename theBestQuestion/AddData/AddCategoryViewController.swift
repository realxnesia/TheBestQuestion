//
//  AddCategoryViewController.swift
//  theBestQuestion
//
//  Created by DHIKA ADITYA ARE on 30/04/21.
//

import UIKit
import CoreData

class AddCategoryViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var categoryArray = [Category]()
    
    @IBOutlet weak var categoryLabel: UITextField!
    @IBOutlet weak var indexCategoryLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testDebugPrint()
        
    }
    
    func saveData(){
        do {
            try context.save()
        } catch {
        }
    }
    
    func getDataFromCoreData() {
        do{
            categoryArray = try self.context.fetch(Category.fetchRequest())
        }catch{
        }
        saveData()
    }

    //MARK: Save Category In Core Data
    @IBAction func buttonSaveCategory(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let saveToCoreData = Category(context: context)
        saveToCoreData.listOfCategory = categoryLabel.text
        saveData()
    }
    
    //MARK: Delete Category In Core Data
    var deleteCategory: Category?
    func deleteCategoryCoreData(index: Int) {
        deleteCategory = categoryArray[index]
        context.delete(deleteCategory!)
        saveData()
    }
    @IBAction func buttonDeleteCategory(_ sender: UIButton) {
        let temp: Int? = Int(indexCategoryLabel.text!)
        deleteCategoryCoreData(index: temp!)
    }
    
    //MARK: Test Print
    func testDebugPrint(){
        getDataFromCoreData()
        print("Jml Array: \(categoryArray.count)")
        print("isi :")
        
        for i in categoryArray{
            print(i.listOfCategory)
        }
    }



}
