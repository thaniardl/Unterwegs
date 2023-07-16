//
//  timeCalculator.swift
//  unterwegs
//
//  Created by THANIA ARDILLA on 16/07/23.
//

import Foundation

struct TimeCalculator {
    public static func calculateTime(distance: Double, speed: Double) -> TimeInterval {
        return distance / (speed / 3600)
    }
}
