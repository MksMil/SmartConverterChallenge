//
//  mainView.swift
//  SmartConverterChallenge
//
//  Created by Миляев Максим on 31.05.2023.
//

import SwiftUI

struct MainView<T>: View where T:Dimension {
    
    
    let dataModel: DataModel = DataModel<T>()
    @State  var firstCase: Dimension
    @State  var secondCase: Dimension
    
    @State private var value: Double = 0
    private var resultNum: String {
        return Converter.convert(from: firstCase,
                                 to: secondCase,
                                 value: value)
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                //first row with pickers
                HStack{
                    Picker("Temp", selection: $firstCase) {
                        ForEach(dataModel.values,id:\.self) {
                            Text($0.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.leading)
                    Picker("Temp", selection: $secondCase) {
                        ForEach(dataModel.values, id: \.self) {
                            Text($0.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.trailing)
                }
                
                //second row with textfilds
                HStack {
                    TextField("Value", value: $value, format: .number)
                        .keyboardType(.decimalPad)
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

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView<UnitTemperature>(firstCase: UnitTemperature.celsius,
                                  secondCase: UnitTemperature.celsius)
    }
}
