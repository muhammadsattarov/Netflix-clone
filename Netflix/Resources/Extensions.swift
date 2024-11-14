//
//  Extensions.swift
//  Netflix
//
//  Created by user on 12/03/24.
//

import Foundation


extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
