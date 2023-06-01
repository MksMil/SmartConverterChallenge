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
    
    @State private var stateKind: Kind = .none
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
                    ZStack {
                        MainView<UnitLength>(firstCase: UnitLength.feet,
                                             secondCase: UnitLength.feet)
                        makeImage(name: "compass.drawing")
                    }
                case .temp:
                    ZStack {
                        MainView<UnitTemperature>(firstCase: UnitTemperature.celsius,
                                                  secondCase: UnitTemperature.celsius)
                        makeImage(name: "thermometer.medium")
                    }
                case .time:
                    ZStack{
                        MainView<UnitDuration>(firstCase: UnitDuration.seconds,
                                               secondCase: UnitDuration.seconds)
                        makeImage(name: "hourglass.bottomhalf.filled")
                    }
                case .volume:
                    ZStack{
                        MainView<UnitVolume>(firstCase: UnitVolume.milliliters,
                                             secondCase: UnitVolume.milliliters)
                        makeImage(name: "takeoutbag.and.cup.and.straw",width: 300,height:  350)
                    }
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
    
    private func makeImage(name: String, width: CGFloat = 250, height: CGFloat = 400) -> some View{
        return Image(systemName: name)
            .resizable()
            .frame(width: width,height: height)
            .aspectRatio(contentMode: .fit)
            .offset(CGSize(width: 0, height: 100))
            .opacity(0.1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
