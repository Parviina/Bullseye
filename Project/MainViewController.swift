//
//  MainViewController.swift
//  Project
//
//  Created by New User on 16.03.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var guessNumberLabel: UILabel!
    
    @IBOutlet weak var restorebutton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    

    @IBOutlet weak var roundLabel: UILabel!

    
    ///Число которое пользователь должен угадать
    var guessNumber: Int = Int.random(in: 1...100)
    
    
    //// Общее количество очков играка
    var score: Int = 0
    
    var round: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let normalThumbImage = UIImage (named: "SliderThumb-Normal")
        let highlitedThumbImage = UIImage (named: "SliderThumb-Highlited")
        
        slider.setThumbImage(normalThumbImage, for: .normal)
        slider.setThumbImage(highlitedThumbImage, for: .highlighted)
        // Do any additional setup after loading the view.
        
        guessNumberLabel.text = "Попробуйте угадать число: \(guessNumber)"
    }

    @IBAction func didTapSelectButton(_ sender: Any) {
        updateRound()
        ////  Задача
        ///1. Прочитать число из слайдера
        let sliderValue: Float = slider.value
        
        ////  2.Перевести это число в Int (sliderValueInt), чтобы можно было сравнить два целых числа
        let sliderValueInt: Int = Int(sliderValue)
        
        ////3.Сравнить два числа, и если они совпадают, то вывести в консоль информацию об этом
        let isValuesEquals: Bool = sliderValueInt == guessNumber
        if isValuesEquals {
            /// - добавить 1 очко
            score = score + 1
            /// - обнавить значение текста для лейбла с очками
            scoreLabel.text = "Очки: \(score)"
            print("Вы угадали число")
        } else {
            print("Вы выбрали число \(sliderValueInt)")
        }
        
    }


    @IBAction func didTapRestartButton(_ sender: Any) {
        slider.value = 50
        guessNumber = Int.random(in: 1...100)
        guessNumberLabel.text = "Попробуйте угадать число: \(guessNumber)"
    }
    
    func setUp() {
         ///Настройка игры.
         ///1.Устанавливаем значение слайдера на 50.
         slider.value = 50
         
         ///2.Установить число которое будут угадывать.
//         updateGuessingNumber()
         
         ///3. Обнуляем очки
        scoreLabel.text = "Очки: " + String(score)
        }
    
    func updateRound(){
        round = round + 1
        roundLabel.text = "Раунд: " + String(round)
    }
    
}

