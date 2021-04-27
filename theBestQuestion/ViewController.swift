//
//  ViewController.swift
//  theBestQuestion
//
//  Created by DHIKA ADITYA ARE on 27/04/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionAns1: UIButton!
    @IBOutlet weak var optionAns2: UIButton!
    @IBOutlet weak var optionAns3: UIButton!
    @IBOutlet weak var progressNow: UIProgressView!
    
    let pertanyaan = [
        Pertanyaan(q: "1+1", a: "2", opt1: "3", opt2: "6", opt3: "2"),
        Pertanyaan(q: "1+2", a: "3", opt1: "4", opt2: "7", opt3: "3"),
        Pertanyaan(q: "1+3", a: "4", opt1: "4", opt2: "6", opt3: "2"),
    ]
    var pertanyaanKe = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePage()
    }


    @IBAction func buttonAnswerPressed(_ sender: UIButton) {
        //MARK: Cek jawaban
        let userAnswer = sender.currentTitle
        let answerRight = pertanyaan[pertanyaanKe].answers
        
        if userAnswer == answerRight{
            print("right")
            view.backgroundColor = .green
            //MARK: Memainkan musik sesuai dengan jawaban
            if answerRight == "2" {
                playSound(targetButton: "A")
            }else if answerRight == "3"{
                playSound(targetButton: "B")
            }else if answerRight == "4"{
                playSound(targetButton: "C")
            }
        }else{
            view.backgroundColor = .red
            print("bego")
        }
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updatePage), userInfo: nil, repeats: false)
        
        //MARK: nambah pertanyaan tiap kalidi klik(Move)
    }
    
    @objc func updatePage(){
        view.backgroundColor = .white
        questionLabel.text = pertanyaan[pertanyaanKe].text
        let ans1 = pertanyaan[pertanyaanKe].opsi1
        let ans2 = pertanyaan[pertanyaanKe].opsi2
        let ans3 = pertanyaan[pertanyaanKe].opsi3
        optionAns1.setTitle(ans1, for: .normal)
        optionAns2.setTitle(ans2, for: .normal)
        optionAns3.setTitle(ans3, for: .normal)
        
        //MARK: ProgressNow
        let tempProgress = Float(pertanyaanKe + 1) / Float(pertanyaan.count) 
        progressNow.progress = tempProgress
    }
    
    func playSound(targetButton: String) {
        let url = Bundle.main.url(forResource: targetButton, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        //MARK: nambah pertanyaan tiap kalidi klik
        if pertanyaanKe+1 < pertanyaan.count{
            pertanyaanKe += 1
        }else{
            pertanyaanKe = 0
        }
        updatePage()
    }
    
    //MARK: BUG
    @IBAction func prevBtn(_ sender: UIButton) {
        if pertanyaanKe+1 < pertanyaan.count{
            pertanyaanKe -= 1
        }else{
            pertanyaanKe = pertanyaan.count
        }
        updatePage()
    }
    
}

