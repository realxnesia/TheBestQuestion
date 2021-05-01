//
//  Pertanyaan.swift
//  theBestQuestion
//
//  Created by DHIKA ADITYA ARE on 27/04/21.
//

import Foundation

struct Pertanyaan {
    let title: String
    let text: String
    let answers: String
    let opsi1: String
    let opsi2: String
    let opsi3: String
    
    init(tl: String, q: String, a: String, opt1: String, opt2: String, opt3: String) {
        title = tl
        text = q
        answers = a
        opsi1 = opt1
        opsi2 = opt2
        opsi3 = opt3
    }
}
