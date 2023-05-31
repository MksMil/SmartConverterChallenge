//
//  LenghtView.swift
//  SmartConverterChallenge
//
//  Created by Миляев Максим on 31.05.2023.
//
//lenght: meters, kilometers, yard, foot, miles

import SwiftUI

enum Length: String, Identifiable, CaseIterable {
    case m, km, yrd, mls, fts
    var id: Self { self }
}

func unitVal(val: Length) -> UnitLength{
    switch val {
    case .m:
        return UnitLength.meters
    case .km:
        return UnitLength.kilometers
    case .yrd:
        return UnitLength.yards
    case .fts:
        return UnitLength.feet
    case .mls:
        return UnitLength.miles
        
    }
}

struct LenghtView: View {
    
    @State private var firstCase: Length = .m
    @State private var secondCase: Length = .m
    
    @State private var value: Double = 0
    private var resultNum: String {
        
        return Converter.convertLenght(from: unitVal(val: firstCase),
                                     to: unitVal(val: secondCase),
                                     value: value)
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                //first row with pickers
                HStack{
                    Picker("Temp", selection: $firstCase) {
                        ForEach(Length.allCases) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.leading)
//                    Spacer()
                    Picker("Temp", selection: $secondCase) {
                        ForEach(Length.allCases) {
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
                        

                    Spacer()
                    
                    Label(title: {
                        Text(resultNum)
                            .font(.title)
                            .lineLimit(1)
                            .fontWeight(.bold)
                            
                    }, icon: {})
                    .labelStyle(.titleOnly)
                    .frame(width: geometry.size.width / 3)
                    .multilineTextAlignment(.center)
                    .padding(geometry.size.width / 10)
                    
                }
                .padding()
            }
            .padding(.top, geometry.size.height / 8)
        }
    
    }
}

struct LenghtView_Previews: PreviewProvider {
    static var previews: some View {
        LenghtView()
    }
}
