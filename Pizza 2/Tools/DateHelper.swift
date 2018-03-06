//
//  DateHelper.swift
//  dream-card-app-ios
//
//  Created by Karim Karimov on 1/22/18.
//  Copyright © 2018 Karim Karimov. All rights reserved.
//

import Foundation
import Localize_Swift
import SwiftDate

class DateHelper {
    
    static func getRelativeDate(date: String) -> String? {
        let date = { () -> Date in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            dateFormatter.locale = Locale.current
            return dateFormatter.date(from: date) ?? Date()
        }()
        
        let formatter = self.getFormatter()
        return try? formatter.colloquial(from: DateInRegion(absoluteDate: date), to: DateInRegion(absoluteDate: Date())).colloquial
    }
    
    static func getFormatter() -> DateInRegionFormatter {
        let formatter = DateInRegionFormatter()
        if
            let path = Bundle.main.path(
                forResource: "SwiftDate",
                ofType: "strings",
                inDirectory: nil,
                forLocalization: Localize.currentLanguage()
            ),
            let localization = try? Localization(path: path) {
            formatter.localization = localization
        } else {
            let localName = LocaleName(rawValue:  Localize.currentLanguage()) ?? .english
            formatter.localization = Localization(locale: localName)
        }
        return formatter
    }
}
