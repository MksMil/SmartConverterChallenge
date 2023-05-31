//
//  TimeView.swift
//  SmartConverterChallenge
//
//  Created by Миляев Максим on 31.05.2023.
//
//time:seconds, minutes, hour, day


import SwiftUI

enum Time: String, CaseIterable, Identifiable{
    case sec, min, hour 
    var id: Self { self }
}

struct TimeView: View {
    @State private var firstCase: Time = .sec
    @State private var secondCase: Time = .sec
    
    @State private var value: Double = 0
    private var resultNum: String {
        return Converter.convertTime(from: unitVal(val: firstCase),
                                     to: unitVal(val: secondCase),
                                     value: value)
    }
    func unitVal(val: Time) -> UnitDuration{
        switch val {
        case .sec:
            return UnitDuration.seconds
        case .min:
            return UnitDuration.minutes
        case .hour:
            return UnitDuration.hours
        }
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                //first row with pickers
                HStack{
                    Picker("Temp", selection: $firstCase) {
                        ForEach(Time.allCases) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.leading)
                    Picker("Temp", selection: $secondCase) {
                        ForEach(Time.allCases) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.trailing)
                }
                
                //second row with textfilds
                HStack {
                    
                    
                    TextField("Value", value: $value, format: .number)
                        .keyboardType(.decimalPad)
//                        .frame(width: geometry.size.width / 3)
                        .multilineTextAlignment(.center)
                        .padding(geometry.size.width / 10)
                        .textFieldStyle(.roundedBorder)
 
                    Label(title: {
                        Text(resultNum)
                            .font(.title)
                            .lineLimit(1)
                            .fontWeight(.bold)
                            
                    }, icon: {})
                    .labelStyle(.titleOnly)
                    .frame(width: geometry.size.width / 2)
                    .multilineTextAlignment(.center)
                }
                .padding()
            }
            .padding(.top, geometry.size.height / 8)
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
