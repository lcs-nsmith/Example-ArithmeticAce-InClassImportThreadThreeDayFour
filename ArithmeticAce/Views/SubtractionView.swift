//
//  SubtractionView.swift
//  ArithmeticAce
//
//  Created by Russell Gordon on 2022-02-09.
//

import SwiftUI

struct SubtractionView: View {
    
    // MARK: Stored properties
    @State var minuend = Int.random(in: 1...144)
    @State var subtrahend = 0
    
    // This string contains whatever the user types in
    @State var inputGiven = ""
    
    @State var history: [HistoryFile] = []
    
    // Has an answer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    @State var answerText = false
    
    // MARK: Computed properties
    // What is the correct difference?
    var correctDifference: Int {
        return minuend - subtrahend
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            QuestionPresentationView(operation: "-", firstValue: minuend, secondValue: subtrahend)
            
            Divider()
            
            AnswerAndResultView(answerCorrect: answerCorrect, answerChecked: answerChecked, inputGiven: $inputGiven)
            
            ZStack {
                
                CheckAnswerButtonView(answerChecked: $answerChecked, inputGiven: inputGiven, answerCorrect: $answerCorrect, output: correctDifference)
                
                
                Button(action: {
                    // Generate a new question
                    minuend = Int.random(in: 1...12)
                    subtrahend = Int.random(in: 1...minuend)
                    
                    // Reset properties that track what's happening with the current question
                    answerChecked = false
                    answerCorrect = false
                    
                    answerText = false
                    
                    // Reset the input field
                    inputGiven = ""
                }, label: {
                    Text("New question")
                        .font(.largeTitle)
                })
                    .padding()
                    .buttonStyle(.bordered)
                // Only show this button when an answer has been checked
                    .opacity(answerChecked == true ? 1.0 : 0.0)
                
            }
            
            AnswerTextView(output: correctDifference, answerChecked: answerChecked, answerCorrect: answerCorrect)
            
            AnimationsAbstractionView(answerChecked: answerChecked, answerCorrect: answerCorrect, history: $history)
            
            Spacer()
        }
        .padding(.horizontal)
        .font(.system(size: 72))
        // Closure(block of code) will run once when the view is loaded
        .task {
            subtrahend = Int.random(in: 1...minuend)
        }
        
        
    }
}

struct SubtractionView_Previews: PreviewProvider {
    static var previews: some View {
        SubtractionView()
    }
}
