//
//  TimeFormatter.swift
//  unterwegs
//
//  Created by THANIA ARDILLA on 16/07/23.
//

import Foundation

struct TimeFormatter {
    public static func formatTime(_ time: TimeInterval) -> String {
        let hours = Int(time / 3600)
        let minutes = Int((time.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(time.truncatingRemainder(dividingBy: 60))
        
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

