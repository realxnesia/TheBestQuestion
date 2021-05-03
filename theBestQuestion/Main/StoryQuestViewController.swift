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
    //var categoryDetails = [Category]()
    
    //Nav Title
    @IBOutlet weak var NavTitleLabel: UINavigationItem!
    @IBOutlet weak var progressNow: UIProgressView!
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
    //var kategoriApetu: String?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //dataDummy()
        updatePage()
        loadViewPage()
        //print(selectedCategory)
    }
    
    func dataDummy(){
        if arrayOfStory.count == 0 {
            tittlelabel.text = ""
            questionLabel.text = ""

            option1Label.setTitle("", for: .normal)
            option2Label.setTitle("", for: .normal)
            option3Label.setTitle("", for: .normal)
        }else{
            NavTitleLabel.title = selectedCategory?.listOfCategory
            tittlelabel.text = arrayOfStory[indexQuestion].tittleStory
            questionLabel.text = arrayOfStory[indexQuestion].question
            
            let ans1 = arrayOfStory[indexQuestion].option1
            option1Label.setTitle(ans1, for: .normal)
            
            let ans2 = arrayOfStory[indexQuestion].option2
            option2Label.setTitle(ans2, for: .normal)
            
            let ans3 = arrayOfStory[indexQuestion].option3
            option3Label.setTitle(ans3, for: .normal)
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
    
    @IBAction func buttonOptionPressed(_ sender: UIButton) {
        //MARK: Cek jawaban
        let userAnswer = sender.currentTitle
        let answerRight = arrayOfStory[indexQuestion].answer
        
        if userAnswer == answerRight{
            sender.backgroundColor = #colorLiteral(red: 1, green: 0.9647058824, blue: 0, alpha: 1)
            view.backgroundColor = #colorLiteral(red: 0.09411764706, green: 0.3019607843, blue: 0.2784313725, alpha: 1)
            //MARK: Memainkan musik sesuai dengan jawaban
//            if answerRight == "2" {
//                playSound(targetButton: "A")
//            }else if answerRight == "3"{
//                playSound(targetButton: "B")
//            }else if answerRight == "4"{
//                playSound(targetButton: "C")
//            }
        }else{
            sender.backgroundColor = #colorLiteral(red: 1, green: 0.9647058824, blue: 0, alpha: 1)
            view.backgroundColor = #colorLiteral(red: 0.5058823529, green: 0, blue: 0.2039215686, alpha: 1)
        }
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updatePage), userInfo: nil, repeats: false)
        
        //MARK: nambah pertanyaan tiap kalidi klik(Move)
    }
    
    @objc func updatePage(){
        view.backgroundColor = #colorLiteral(red: 0.1529411765, green: 0.1803921569, blue: 0.2901960784, alpha: 1)
        option1Label.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9803921569, blue: 1, alpha: 1)
        option2Label.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9803921569, blue: 1, alpha: 1)
        option3Label.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9803921569, blue: 1, alpha: 1)
        
        dataDummy()
        //MARK: ProgressNow(harusnya gabung sama dataDummy() di updatePage)
        let tempProgress = Float(indexQuestion + 1) / Float(arrayOfStory.count)
        progressNow.progress = tempProgress
    }
    
    
    @IBAction func btnNextQuest(_ sender: UIButton) {
        //MARK: nambah pertanyaan tiap kalidi klik
        if indexQuestion+1 < arrayOfStory.count{
            indexQuestion += 1
        }else{
            indexQuestion = 0
        }
        //MARK: Update tampilan page ke next question
        updatePage()
    }
    
    @IBAction func btnPrevQuest(_ sender: UIButton) {
        //mis: jumlah idx 5. current idx adalah 3. Jika 5-3=2 dan 2 masih lebih besar dari 0, maka dia bisa mundur 1 idx(salah logic)
        // currentIndex+1 adlah 2, jumlah index ada 5. 2-5 = -3 || 3-5 = -2. ||  -2-1=2
        
//        let currentIndex = (indexQuestion + 1) - arrayOfStory.count //(0+1) - 5 -> -5 // (1+1) - 5 -> -3
//        let currentIndex2 = (currentIndex * -1) - arrayOfStory.count // (-5 * -1) - 5 -> 0 // (-3 * -1) - 5 -> -2
//        let currentIndex3 = currentIndex2 * -1 // 0 * -1 = 0 // -2 * -1 = 2
//
//        if currentIndex3 >= 0{
//            indexQuestion -= 1
//        }else{
//            let temp = arrayOfStory.count
//            indexQuestion = temp
//        }
        //3 % 2 = 1
        //5 % 4 = 1 -> 5 - 1 = 4
/*        let x = arrayOfStory.count % indexQuestion+1
        print(x)
        let y = indexQuestion+1 % arrayOfStory.count
        print(y)
        let z = ((arrayOfStory.count % indexQuestion+1) * -1) + arrayOfStory.count //-1+3 = 2
        print(z)
        
        if ((arrayOfStory.count % indexQuestion+1) * -1) + arrayOfStory.count > 0{
            indexQuestion -= 1
        }else{
            let temp = arrayOfStory.count
            indexQuestion = temp
        }
 */
        //indexQuestion -= 1
        
        if indexQuestion+1 % arrayOfStory.count >= 0{
            indexQuestion -= 1
        }else{
            let temp = arrayOfStory.count - 1 //3 - 1 = 2
            indexQuestion = temp //2
        }
        
        updatePage()
        
        
    }
    
    //MARK: kirim
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToAddStory"){
            let destinationVC = segue.destination as! AddStoryViewController
            destinationVC.selectedCategory = selectedCategory
        }
    }
}


/*MARK: BUG
 1. Buat navigation bar(big tittle dan seterusnya),
 2. Index masih out of range(FIXED),
 3. Tambahin musik suara VN,
 4. Bug previous page
 */

