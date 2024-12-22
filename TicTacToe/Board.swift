//
//  Board.swift
//  TicTacToe
//
//  Created by Regina Son on 12/20/24.
//

class Board {
    var grid: [[CellType]] = Array(repeating: Array(repeating: .empty, count: 3), count: 3)
    
    func mark(column: Int, row: Int, turn: Player) -> Bool {
        if column < 0 || column >= 3 || row < 0 || row >= 3 {
            print("Invalid move")
            return false
        }
        else if grid[row][column] != .empty {
            print("Cell already marked")
            return false
        }
        else {
            switch turn {
            case .O: grid[row][column] = .O
            case .X: grid[row][column] = .X
            }
            return true
        }
    }
    func show() {
        for row in grid {
            print("|", terminator: "")
            for column in row {
                print(column.rawValue, terminator: "|")
            }
            print("")
        }
    }
    
    //n번째 row의 값들이 모두 같다면 isRunning = false로 대입하고 그 값이 winner임을 print
    //집합 -> 원소의 개수가 1개면 모두 같은 것!
    //n번째 column과 대각선 2개에 대해서도 시행
    
    func checkArray(array:[CellType]) -> Bool {
        if Set(array).count == 1 && Set(array) != [.empty] {
            return false
        }
        else {return true}
    }
    
    var isThereNoBingo: Bool = true
    
    func checkRow() {
        for i in 0...2 {
            let row: [CellType] = [grid[i][0], grid[i][1], grid[i][2]]
            if checkArray(array: row) == false {
                isThereNoBingo = false
            }
        }
    }
    
    func checkColumn() {
        for i in 0...2 {
            let column: [CellType] = [grid[0][i], grid[1][i], grid[2][i]]
            if checkArray(array: column) == false {
                isThereNoBingo = false
            }
        }
    }
    
    func checkDiagonal() {
        let diag1:[CellType] = [grid[0][0], grid[1][1], grid[2][2]]
        let diag2:[CellType] = [grid[0][2], grid[1][1], grid[2][0]]
        if checkArray(array: diag1) == false || checkArray(array: diag2) == false {
            isThereNoBingo = false
        }
    }
    
    func checkBingo() {
        checkRow()
        checkColumn()
        checkDiagonal()
    }
    
    var isDraw: Bool = false
    func checkDraw() {
        var allCell: [CellType] = []
        for i in 0...2 {
            for j in 0...2 {
                allCell.append(grid[i][j])
            }
        }
        if Set(allCell).contains(.empty) == false {
            isDraw = true
        }
        
    }
    
}

enum CellType: String {
    case empty = "."
    case O
    case X
}

enum Player {
    case O
    case X
    
    mutating func switchTurn() { //복제하고 바꾼담에 원래꺼지움 enum이니까
        switch self {
        case .O:
            self = .X
        case .X:
            self = .O
        }
    }
}
