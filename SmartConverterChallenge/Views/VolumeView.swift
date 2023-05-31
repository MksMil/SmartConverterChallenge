//
//  VolumeView.swift
//  SmartConverterChallenge
//
//  Created by Миляев Максим on 31.05.2023.
//
//volume: mililiters, liters, cup, pints, galoon

import SwiftUI

enum VolumeEnum: String, CaseIterable, Identifiable {
    case ml, l, cup, pnt, gl
    var id: Self {self}
}

struct VolumeView: View {
    @State private var firstCase: VolumeEnum = .ml
    @State private var secondCase: VolumeEnum = .ml
    
    @State private var value: Double = 0
    private var resultNum: String {
        return Converter.convertVolume(from: unitVal(val: firstCase),
                                     to: unitVal(val: secondCase),
                                     value: value)
    }
    func unitVal(val: VolumeEnum) -> UnitVolume{
        switch val {
        case .ml:
            return UnitVolume.milliliters
        case .l:
            return UnitVolume.liters
        case .cup:
            return UnitVolume.cups
        case .pnt:
            return UnitVolume.pints
        case .gl:
            return UnitVolume.gallons
            
        }
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                //first row with pickers
                HStack{
                    Picker("Temp", selection: $firstCase) {
                        ForEach(VolumeEnum.allCases) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.leading)
                    Picker("Temp", selection: $secondCase) {
                        ForEach(VolumeEnum.allCases) {
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

struct VolumeView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeView()
    }
}
