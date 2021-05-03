//
//  AddStoryViewController.swift
//  theBestQuestion
//
//  Created by DHIKA ADITYA ARE on 27/04/21.
//

import UIKit
import CoreData


class AddStoryViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //MARK: Menampung data dari coredata
    var arrayOfStory = [Story]()
    var selectedCategory: Category?
    

    @IBOutlet weak var titleLable: UITextField!
    @IBOutlet weak var storyLabel: UITextField!
    @IBOutlet weak var questionLabel: UITextField!
    @IBOutlet weak var answerLabel: UITextField!
    @IBOutlet weak var option1label: UITextField!
    @IBOutlet weak var option2Label: UITextField!
    @IBOutlet weak var option3Label: UITextField!
    @IBOutlet weak var deleteByIndex: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //deleteDataCoreData(index: 0)
        getDataFromCoreData()
        printData()

    }
    
    func saveData() {
        do {
            try context.save()
        } catch {
        }
    }
    
    @IBAction func backToMainAndSave(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let createStory = Story(context: context) //kok gabisa ya?
        
        //MARK: Masukin data ke CoreData (WAJIB KARENA PAKAI RELATIONSHIP)
        createStory.parentCategory = selectedCategory
        //MARK: Masukin data ke CoreData
        createStory.tittleStory = titleLable.text
        createStory.story = storyLabel.text
        createStory.question = questionLabel.text
        createStory.answer = answerLabel.text
        createStory.option1 = option1label.text
        createStory.option2 = option2Label.text
        createStory.option3 = option3Label.text
        
        saveData()
        //dismiss(animated: true, completion:nil )
    }
    
    //MARK: Delete Story From Core Data
    var deleteStory: Story?
    func deleteDataCoreData(index: Int) {
        deleteStory = arrayOfStory[index]
        context.delete(deleteStory!)
        saveData()
    }
    
    @IBAction func goDelete(_ sender: Any) {
        let temp: Int? = Int(deleteByIndex.text!)
        //print(temp)
        deleteDataCoreData(index: temp!)
    }
    
    
    //MARK: Menampilkan data ke terminal debug
    func getDataFromCoreData() {
        do{
            arrayOfStory = try self.context.fetch(Story.fetchRequest())
        }catch{
        }
        saveData()
    }
    
    func printData(){
        for story in arrayOfStory{
            print("====Start====")
            print("Title story : \(story.tittleStory)")
            print("story : \(story.story)")
            print("question : \(story.question)")
            print("answer : \(story.answer)")
            print("option1 : \(story.option1)")
            print("option2 : \(story.option2)")
            print("option3 : \(story.option3)")
            print("")
        }
        print("=========")
        print(arrayOfStory.count)
        print("=========")
    }

}
