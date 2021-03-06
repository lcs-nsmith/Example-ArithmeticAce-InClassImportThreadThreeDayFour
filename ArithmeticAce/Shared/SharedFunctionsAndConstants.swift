//
//  SharedFunctionsAndConstants.swift
//  ArithmeticAce
//
//  Created by Nathan Smith on 2022-02-26.
//

import Foundation

// Return the directory that we can save user data in
func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

// Define a file label (or file name) that we will write to within that directory
let savedHistoryLabel = "savedHistory"
