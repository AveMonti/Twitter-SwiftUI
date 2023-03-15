//
//  DateFormatter.swift
//  TwitterTest
//
//  Created by Mateusz Chojnacki on 24/02/2023.
//

import Foundation

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}()
