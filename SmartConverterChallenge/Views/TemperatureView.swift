//
//  TemperatireView.swift
//  SmartConverterChallenge
//
//  Created by Миляев Максим on 31.05.2023.
//

/*
|               |             |
| picker        |   picker    |
|               |             |
| textField     |   label     |
|               |             |
 
 */
import SwiftUI

enum Temp: String, Identifiable, CaseIterable{
    case C, F, K
    var id: Self { self }
}

struct TemperatureView: View {
    
    @State private var firstTemp: Temp = .C
    @State private var secondTemp: Temp = .C
    
    @State private var firstNum: Double = 0
    private var resultNum: String {
        
        return Converter.convertTemp(from: unitVal(val: firstTemp),
                                     to: unitVal(val: secondTemp),
                                     value: firstNum)
    }
    
    func unitVal(val: Temp) -> UnitTemperature{
        switch val {
        case .C:
            return UnitTemperature.celsius
        case .K:
            return UnitTemperature.kelvin
        case .F:
            return UnitTemperature.fahrenheit
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                //first row with pickers
                HStack{
                    Picker("Temp", selection: $firstTemp) {
                        ForEach(Temp.allCases) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    Spacer()
                    Picker("Temp", selection: $secondTemp) {
                        ForEach(Temp.allCases) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                }
                
                //second row with textfilds
                HStack {
                    
                    
                    TextField("Value", value: $firstNum, format: .number)
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

struct TemperatireView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
    }
}
