//
//  JSONStorage.swift
//  ArithmeticAce
//
//  Created by Nathan Smith on 2022-02-26.
//

import Foundation

struct HistoryFile: Hashable, Encodable {
    let firstValue: Int
    let operation: String
    let secondValue: Int
    let input: Int
    let correctInput: Int
    let answerCorrect: Bool
}
