//
//  DataModel.swift
//  SmartConverterChallenge
//
//  Created by Миляев Максим on 31.05.2023.
//

import Foundation

struct DataModel<T> where T: Dimension {
    var values:[Dimension] {
        switch T.self {
        case is UnitTemperature.Type:
            return [UnitTemperature.celsius,
                    UnitTemperature.fahrenheit,
                    UnitTemperature.kelvin]
        case is UnitLength.Type:
            return [UnitLength.feet,
                    UnitLength.yards,
                    UnitLength.meters,
                    UnitLength.kilometers,
                    UnitLength.miles]
        case is UnitDuration.Type:
            return [UnitDuration.seconds,
                    UnitDuration.minutes,
                    UnitDuration.hours]
        case is UnitVolume.Type:
            return [UnitVolume.milliliters,
                    UnitVolume.cups,
                    UnitVolume.pints,
                    UnitVolume.liters,
                    UnitVolume.gallons]
        default : return []
        }
    }
}
