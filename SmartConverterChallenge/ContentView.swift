//
//  ContentView.swift
//  SmartConverterChallenge
//
//  Created by Миляев Максим on 31.05.2023.
//

//temperature: celcius, fahrenheit, kelvin
//lenght: meters, kilometers, yard, foot, miles
//time:seconds, minutes, hour
//volume: mililiters, liters, cup, pints, galoon

import SwiftUI

enum Kind:  String, CaseIterable, Identifiable {
    var id: Self { self }
    case lenght, temp, time, volume, none
}



struct ContentView: View {
    
    @State private var stateKind: Kind = .temp
    var body: some View {
        ZStack(alignment: .center) {
            VStack {
                Picker("Choose what you need to convert",
                       selection: $stateKind) {
                    ForEach(Kind.allCases) {
                        Text("\($0.rawValue)")
                    }
                }
                   .pickerStyle(.segmented)
                Spacer()
            }
            Section {
                switch stateKind {
                case .none:
                    NoneView()
                case .lenght:
                    MainView<UnitLength>(firstCase: UnitLength.feet,
                             secondCase: UnitLength.feet)
                case .temp:
                    MainView<UnitTemperature>(firstCase: UnitTemperature.celsius,
                             secondCase: UnitTemperature.celsius)
                case .time:
                    MainView<UnitDuration>(firstCase: UnitDuration.seconds,
                             secondCase: UnitDuration.seconds)
                case .volume:
                    MainView<UnitVolume>(firstCase: UnitVolume.milliliters,
                             secondCase: UnitVolume.milliliters)
                }
            }
                
        }
        .padding()
        .background {
            Color(.gray)
                .ignoresSafeArea()
                .opacity(0.2)
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
