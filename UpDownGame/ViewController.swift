//
//  ViewController.swift
//  UpDownGame
//
//  Created by Langpeu on 8/7/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var comNum = Int.random(in: 1...10)
    var selNum = -1 // 비선택시 예외처리를 위해 -1 저장
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1) 메인레이블에 "선택하세요"
        // 2) 숫자 레이블은 ""
        // 3) comNum 초기화
        resetGame()
    }

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        // 1) 버튼의 숫자를 가져와야함
        // 2) 숫자 레이블이 변하도록 (숫자에 따라)
        // 3) 선택한 숫자를 변수에다가 저장 (선택)
        if let btnLabel = sender.currentTitle,
           let btnNum = Int(btnLabel) {
            selNum = btnNum
            numberLabel.text = btnLabel
        }
        
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 1) 컴퓨터의 숫자와 내가 선택한 숫자를 비교 UP / Down / Bingo (메인레이블)
        if selNum != -1 {
            if comNum == selNum {
                mainLabel.text = "Bingo😍"
            }else if comNum > selNum {
                mainLabel.text = "UP"
            }else if comNum < selNum {
                mainLabel.text = "DOWN"
            }
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        resetGame()
    }
    
    func resetGame() {
        comNum = Int.random(in: 1...10)
        selNum = -1
        mainLabel.text = "선택하세요"
        numberLabel.text = ""
    }
    
}

