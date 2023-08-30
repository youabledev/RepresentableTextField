//
//  String+Extension.swift
//  custom component
//
//  Created by FramiOS on 2023/08/30.
//

import Foundation

extension String {
    var isPhoneNumber: Bool {
        let _str = self.replacingOccurrences(of: "-", with: "")
        let regex = "([0-9]{3})([0-9]{4})([0-9]{4})$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: _str)
    }
    
    var prettyPhoneNumber: String {
        let _str = self.replacingOccurrences(of: "-", with: "").prefix(11)
        
        let patterns = [
            (minCount: 7, pattern: "([0-9]{3})([0-9]{4})([0-9]*)", template: "$1-$2-$3"),
            (minCount: 3, pattern: "([0-9]{3})([0-9]*)", template: "$1-$2")
        ]
        
        for (minCount, pattern, template) in patterns {
            if _str.count >= minCount, let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) {
                let modString = regex.stringByReplacingMatches(in: String(_str), options: [], range: NSRange(_str.startIndex..., in: _str), withTemplate: template)
                return modString
            }
        }
        
        return self
    }
}
