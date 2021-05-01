//
//  StoryQuestViewController.swift
//  theBestQuestion
//
//  Created by DHIKA ADITYA ARE on 30/04/21.
//

import UIKit
import CoreData

class StoryQuestViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var arrayOfStory = [Story]()
    
    @IBOutlet weak var tittlelabel: UILabel!
    //harusnya ada story
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var option1Label: UIButton!
    @IBOutlet weak var option2Label: UIButton!
    @IBOutlet weak var option3Label: UIButton!
    
    var indexQuestion = 0
    
    var selectedCategory: Category?{
        didSet{
            loadItems()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        dataDummy()
        loadViewPage()
    }
    
    func dataDummy(){
        if arrayOfStory.count == 0 {
            tittlelabel.text = ""
            questionLabel.text = ""
            
            //MARK: BUG belum bisa nampilin button text
            questionLabel.text = ""
            questionLabel.text = ""
            questionLabel.text = ""
        }else{
            tittlelabel.text = arrayOfStory[0].tittleStory
            questionLabel.text = arrayOfStory[0].question
        }
    }
    func loadViewPage(){
        option1Label.layer.cornerRadius = 15
        option2Label.layer.cornerRadius = 15
        option3Label.layer.cornerRadius = 15
    }
    
    func loadItems(with request: NSFetchRequest<Story> = Story.fetchRequest()){
        //error disini, gaboleh ? opsional harus di force!
        let predicate = NSPredicate(format: "parentCategory.listOfCategory MATCHES %@", selectedCategory!.listOfCategory!)
        request.predicate = predicate
        do {
            arrayOfStory = try context.fetch(request)
        } catch  {
        }
    }
    
    @IBAction func btnNextQuest(_ sender: UIButton) {
        //MARK: nambah pertanyaan tiap kalidi klik
        if indexQuestion+1 < arrayOfStory.count{
            indexQuestion += 1
        }else{
            indexQuestion = 0
        }
        //updatePage()
    }
    
    
    //MARK: kirim
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToAddStory"){
            let destinationVC = segue.destination as! AddStoryViewController
            destinationVC.selectedCategory = selectedCategory
        }
    }
        
}

