//
//  TicTacToeGame.swift
//  TicTacToe
//
//  Created by Regina Son on 12/20/24.
//
import Foundation

class TicTacToeGame {
    private var isRunning: Bool = false  //밖에서는 접근 못하게 하는!! 대부분은 private 선언함 "encapsulation 캡슐화"
    private var turn: Player = .O
    private let board: Board = Board()
    
    
    
    func play() {
        while isRunning {
            board.show()
            print("\(turn)의 차례입니다.")
            print("입력하세요:")
            guard let input = readLine() else {return}
            // readLine: 내가 지금 쓴거를 읽어라
            if input == "exit" {
                exit()
            }
            let position = input.components(separatedBy: ",")
            guard let positionX = Int(position[0]) else {return}
            guard let positionY = Int(position[1]) else {return}
            
            if board.mark(column: positionX, row: positionY, turn: turn) {
                turn.switchTurn()
            }
            
            board.checkBingo()
            if !board.isThereNoBingo {
                isRunning = false
            }
            
            board.checkDraw()
            if board.isDraw {
                isRunning = false
            }
            
        }
        
        if !board.isThereNoBingo {
            board.show()
            turn.switchTurn()
            print("\(turn)님이 승리하셨습니다.")
        }
        else if board.isDraw && board.isThereNoBingo {
            board.show()
            print("무승부입니다!")
        }
        
    }
    
    
    
    
    
    func start() {
        isRunning = true
    }
    
    func exit() {
        isRunning = false
    }
}
