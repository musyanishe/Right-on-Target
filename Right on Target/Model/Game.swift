//
//  Game.swift
//  Right on Target
//
//  Created by Евгения Шевцова on 09.03.2022.
//

import UIKit

protocol GameProtocol {
//    количество заработанных очков
    var score: Int { get }
//    загаданное число
    var currentSecretValue: Int { get }
//    проверка - закончена ли игра
    var isGameEnded: Bool { get }
//    начинает новую игру и сразу стартует новый раунд
    func restartGame()
//    начинает новый раунд и загадывает новое число
    func startNewRound()
//    Сравнивает загаданное число с переданным значением и начисляет очки
    func calculateScore(with value: Int)
}

class Game: GameProtocol {
    
    var score: Int = 0
//    минимальное загаданное знач-е
    private var minSecretValue: Int
//    максимальное загаданное знач-е
    private var maxSecretValue: Int
    var currentSecretValue: Int = 0
//    Количество раундов
    private var lastRound: Int
    private var currentRound: Int = 1
    
    var isGameEnded: Bool {
        if currentRound >= lastRound {
            return true
        } else {
            return false
        }
    }
    
    init?(startValue: Int, endValue: Int, rounds: Int) {
//        стартовое число для выбора случайного числа не может быть больше конечного
        guard startValue <= endValue else { return nil }
        minSecretValue = startValue
        maxSecretValue = endValue
        lastRound = rounds
        currentSecretValue = self.getNewSecretValue()
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentSecretValue = self.getNewSecretValue()
        currentRound += 1
    }
    
//    загадываем и возвращаем новое загаданное знач-е
    private func getNewSecretValue() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }
    
//    подсчитываем кол-во очков
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 + value - currentSecretValue
        } else {
            score += 50
        }
    }
    
}
