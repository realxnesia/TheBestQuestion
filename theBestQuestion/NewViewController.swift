////
////  ViewController.swift
////  theBestQuestion
////
////  Created by DHIKA ADITYA ARE on 27/04/21.
////
//
//import UIKit
//import AVFoundation
//
//class NewViewController: UIViewController {
//    var player: AVAudioPlayer?
//
//    @IBOutlet weak var judulLabel: UILabel!
//    @IBOutlet weak var questionLabel: UILabel!
//    @IBOutlet weak var optionAns1: UIButton!
//    @IBOutlet weak var optionAns2: UIButton!
//    @IBOutlet weak var optionAns3: UIButton!
//    @IBOutlet weak var progressNow: UIProgressView!
//    @IBOutlet weak var buttonPlay: UIButton!
//    
//    var idx : Int?
//    //var sendKategori : DbStory?
//    
//    let pertanyaan = [
//        Pertanyaan(tl: "Story 2: Sering Online", q: "Kamu sedang berada di keramaian, lalu ingin berkenalan. Apa yang harus kamu katakan?", a: "Hallo", opt1: "Hallo", opt2: "Beb, kok kamu berubah si. Aku tahu belakangan ini kamu sibuk kerja. Tapi aku minta waktunya dong Boleh ga?", opt3: "Beb, kamu biasanyakan menyempatkan waktu weekend sama aku. Belakangan ini kita udah jarang. Mau ga kita lakuin kaya dulu lagi?"),
//        Pertanyaan(tl: "Story 2: Sering Online", q: "Kamu sedang berada di keramaian, lalu ingin berkenalan. Apa yang harus kamu katakan?", a: "Hallo", opt1: "Hallo", opt2: "Beb, kok kamu berubah si. Aku tahu belakangan ini kamu sibuk kerja. Tapi aku minta waktunya dong Boleh ga?", opt3: "Beb, kamu biasanyakan menyempatkan waktu weekend sama aku. Belakangan ini kita udah jarang. Mau ga kita lakuin kaya dulu lagi?")
//
//    ]
//    var pertanyaanKe = 0
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        updatePage()
//        tampilan()
//        
//        print(idx)
//        print(sendKategori)
//        
//    }
//    
//    func tampilan(){
//        optionAns1.layer.cornerRadius = 15
//        optionAns2.layer.cornerRadius = 15
//        optionAns3.layer.cornerRadius = 15
//        buttonPlay.layer.cornerRadius = buttonPlay.frame.width / 2
//    }
//
//
//    @IBAction func buttonAnswerPressed(_ sender: UIButton) {
//        //MARK: Cek jawaban
//        let userAnswer = sender.currentTitle
//        //let answerRight = pertanyaan[pertanyaanKe].answers
//        let answerRight = sendKategori?.answer
//        
//        if userAnswer == answerRight{
//            print("right")
//            view.backgroundColor = #colorLiteral(red: 0.09411764706, green: 0.3019607843, blue: 0.2784313725, alpha: 1)
//            //MARK: Memainkan musik sesuai dengan jawaban
//            if answerRight == "2" {
//                playSound(targetButton: "A")
//            }else if answerRight == "3"{
//                playSound(targetButton: "B")
//            }else if answerRight == "4"{
//                playSound(targetButton: "C")
//            }
//        }else{
//            view.backgroundColor = #colorLiteral(red: 0.5058823529, green: 0, blue: 0.2039215686, alpha: 1)
//            print("bego")
//        }
//        
//        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updatePage), userInfo: nil, repeats: false)
//        
//        //MARK: nambah pertanyaan tiap kalidi klik(Move)
//    }
//    
//    @objc func updatePage(){
//        view.backgroundColor = #colorLiteral(red: 0.1529411765, green: 0.1803921569, blue: 0.2901960784, alpha: 1)
//        //questionLabel.textColor =
//        
//        judulLabel.text = sendKategori?.judulStory
//        questionLabel.text = sendKategori?.question
//        let ans1 = sendKategori?.option1
//        let ans2 = sendKategori?.option2
//        let ans3 = sendKategori?.option3
//        
//        optionAns1.setTitle(ans1, for: .normal)
//        optionAns2.setTitle(ans2, for: .normal)
//        optionAns3.setTitle(ans3, for: .normal)
//        
//        //MARK: ProgressNow
//        let tempProgress = Float(pertanyaanKe + 1) / Float(pertanyaan.count)
//        progressNow.progress = tempProgress
//    }
//    
//    func playSound(targetButton: String) {
//        let url = Bundle.main.url(forResource: targetButton, withExtension: "wav")
//        player = try! AVAudioPlayer(contentsOf: url!)
//        player?.play()
//    }
//    
//    @IBAction func nextBtn(_ sender: UIButton) {
//        //MARK: nambah pertanyaan tiap kalidi klik
//        if pertanyaanKe+1 < pertanyaan.count{
//            pertanyaanKe += 1
//        }else{
//            pertanyaanKe = 0
//        }
//        updatePage()
//    }
//    
//    //MARK: BUG
//    @IBAction func prevBtn(_ sender: UIButton) {
//        if pertanyaanKe+1 < pertanyaan.count{
//            pertanyaanKe -= 1
//        }else{
//            pertanyaanKe = pertanyaan.count
//        }
//        updatePage()
//    }
//    
//}
//
