//
//  Converter.swift
//  SmartConverterChallenge
//
//  Created by Миляев Максим on 31.05.2023.
//

import Foundation

let formatter: NumberFormatter  = {
    let form = NumberFormatter()
    form.maximumFractionDigits = 3
    return form
}()

struct Converter {
    
    static func convertTemp(from: UnitTemperature,to: UnitTemperature ,value: Double) -> String{
        let fromVal = Measurement(value: value, unit: from)
        let toVal = fromVal.converted(to: to)
        let result =  formatter.string(from: NSNumber(value: toVal.value))
        return result ?? ""
    }
    
    static func convertLenght(from: UnitLength,to: UnitLength ,value: Double) -> String{
        let fromVal = Measurement(value: value, unit: from)
        let toVal = fromVal.converted(to: to)
        let result =  formatter.string(from: NSNumber(value: toVal.value))
        return result ?? ""
    }
    
    static func convertTime(from: UnitDuration,to: UnitDuration ,value: Double) -> String{
        let fromVal = Measurement(value: value, unit: from)
        let toVal = fromVal.converted(to: to)
        let result =  formatter.string(from: NSNumber(value: toVal.value))
        return result ?? ""
    }
    
    static func convertVolume(from: UnitVolume,to: UnitVolume ,value: Double) -> String{
        let fromVal = Measurement(value: value, unit: from)
        let toVal = fromVal.converted(to: to)
        let result =  formatter.string(from: NSNumber(value: toVal.value))
        return result ?? ""
    }
    static func convert<T>(from: T, to: T, value: Double) -> String where T: Dimension {
        let fromVal = Measurement(value: value, unit: from)
        let toVal = fromVal.converted(to: to)
        let result =  formatter.string(from: NSNumber(value: toVal.value))
        return result ?? ""
    }
    
    
}
