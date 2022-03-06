//
//  ViewController.swift
//  Right on Target
//
//  Created by Евгения Шевцова on 26.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var number = 0
    var round = 1
    var points = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    override func loadView() {
        super.loadView()
        print("loadView")
        
//        создаем метку для вывода номера версии
//        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
//        изменяем текст метки
//        versionLabel.text = "Версия 1.1"
//        добавляем метку в родительский view
//        self.view.addSubview(versionLabel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        // генерируем случайное число
        self.number = Int.random(in: 1...50)
        // передаем значение случайного числа в label
        self.label.text = String(self.number)
    }
    
    @IBAction func showNextSceen() {
//        загрузка storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        загрузка view controller и его сцены со Storyboard
        let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        self.present(viewController, animated: true, completion: nil)
    }

    @IBAction func checkNumber() {
//        получаем значение на слайдере
        let numSlider = Int(self.slider.value)
        // сравниваем значение с загаданным
        // и подсчитываем очки
        if numSlider > self.number {
        self.points += 50 - numSlider + self.number
        } else if numSlider < self.number {
        self.points += 50 - self.number + numSlider
        } else {
        self.points += 50
        }
        if self.round == 5 {
        // выводим информационное окно с результатами игры
        let alert = UIAlertController(
        title: "Игра окончена",
        message: "Вы заработали \(self.points) очков", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        self.round = 1
        self.points = 0
        } else {
            self.round += 1
        }
        self.number = Int.random(in: 1...50)
        // передаем значение случайного числа в label
        self.label.text = String(self.number)
    }
}

