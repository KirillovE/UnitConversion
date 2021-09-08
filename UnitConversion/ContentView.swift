//
//  ContentView.swift
//  UnitConversion
//
//  Created by Евгений Кириллов on 08.09.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var userValueInput = ""
    @State private var userUnitInput = 0
    @State private var userUnitOutput = 2
    
    private let units = ["seconds", "minutes", "hours", "days"]
    
    private var inputInSeconds: Double {
        let inputValue = Double(userValueInput) ?? 0
        switch userUnitInput {
        case 0: return inputValue
        case 1: return inputValue * 60
        case 2: return inputValue * 3_600
        case 3: return inputValue * 86_400
        default: return 0
        }
    }
    
    private var result: Double {
        switch userUnitOutput {
        case 0: return inputInSeconds
        case 1: return inputInSeconds / 60
        case 2: return inputInSeconds / 3_600
        case 3: return inputInSeconds / 86_400
        default: return 0
        }
    }
    
    var body: some View {
        Form {
            Section(header: Text("Source value")) {
                TextField("Input source value", text: $userValueInput)
                    .keyboardType(.decimalPad)
                Picker("Pick a source unit", selection: $userUnitInput) {
                    ForEach(0 ..< units.count) {
                        Text(units[$0])
                    }
                }
            }
            
            Section(header: Text("Result value")) {
                Picker("Pick a source unit", selection: $userUnitOutput) {
                    ForEach(0 ..< units.count) {
                        Text(units[$0])
                    }
                }
                Text("\(result)")
            }
            
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
