//
//  ViewController.swift
//  Right on Target
//
//  Created by Евгения Шевцова on 26.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
//    сущность Игра
    var game: Game!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
// MARK: - жизненный цикл
    override func viewDidLoad() {
        super.viewDidLoad()
//       создаем экземляр сущности Игра
        game = Game(startValue: 1, endValue: 50, rounds: 5)
//        Обновляем данные о текущем значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
// MARK: - Взаимодействие View - Model
    
//    Проверка выбранного пользователем числа
    @IBAction func checkNumber() {
//        высчитываем очки за раунд
        game.calculateScore(with: Int(slider.value))
//    Проверяем окончена ли игра
        if game.isGameEnded {
            showAlertWith(score: game.score)
//            Начинаем игру заново
            game.restartGame()
        } else {
            game.startNewRound()
        }
//        Обновляем данные о текущем значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
//    MARK: - Обновление View
//    Обновление текста загаданного числа
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
    }
    
//    Отображение всплывающего окна с результатом
    private func showAlertWith(score: Int) {
        let alert = UIAlertController (
            title: "Игра окончена",
            message: "Вы заработали \(score) очков",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заного", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

