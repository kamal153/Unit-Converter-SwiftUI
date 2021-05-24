//
//  Temprature.swift
//  unit conveter
//
//  Created by kamal on 23/05/21.
//

import SwiftUI

struct Temperature: View {
    
    @State private var temperature = ""
    @State private var inputUnit = 1
    @State private var outputUnit = 1
    // "Celsius" => 0, "Fahrenheit" => 1, "Kelvin" => 2
    var tempUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
    func convert() -> String {
        let temp = Double(temperature) ?? 0
        if temperature.count == 0 {
            return ""
        }
        switch inputUnit {
        case 0:
            switch outputUnit {
            case 0:
                return String(format: "%.2f °C", temp)
            case 1:
                return String(format: "%.2f °F", ( temp * 1.8 ) + 32)
            case 2:
                return String(format: "%.2f K", temp + 273.15)
            default:
                return ""
            }
        case 1:
            switch outputUnit {
            case 0:
                return String(format: "%.2f °C", ( temp - 32 ) * 0.55556)
            case 1:
                return String(format: "%.2f °F", temp)
            case 2:
                return String(format: "%.2f K", ( ( temp - 32 ) * 0.55556 ) + 273.15)
            default:
                return ""
            }
        case 2:
            switch outputUnit {
            case 0:
                return String(format: "%.2f °C", temp - 273.15)
            case 1:
                return String(format: "%.2f °F", ( ( temp - 273.15 ) * 1.8 ) + 32)
            case 2:
                return String(format: "%.2f K", temp)
            default:
                return ""
            }
        default:
            return ""
        }
    }
    
    var body: some View {
        ZStack {
            Color(red: 0.88, green: 0.90, blue: 0.92, opacity: 1.00).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("Input")
                    .font(.title)
                    .foregroundColor(.gray)
                Section() {
                    TextField("Enter temperature", text: $temperature)
                        .padding()
                        .font(.system(size: 25))
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(0..<tempUnits.count) { i in
                            Text("\(tempUnits[i])")
                                .font(.system(size: 25))
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    .padding()
                }.background(Color(.white))
                .cornerRadius(12)
                
                Divider()
                    .padding()
                
                Text("Output")
                    .font(.title)
                    .foregroundColor(.gray)
                Section() {
                    Picker("Input Unit", selection: $outputUnit) {
                        ForEach(0..<tempUnits.count) { i in
                            Text("\(tempUnits[i])")
                                .font(.system(size: 25))
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    RoundedRectangle(cornerRadius: 12)
                        .frame(height: 60)
                        .foregroundColor(.white)
                        .overlay(
                            Text("\(convert())")
                                .padding()
                                .font(.system(size: 25))
                        )
                }.background(Color(.white))
                .cornerRadius(12)
            }.padding()
        }
    }
}

struct Temperature_Previews: PreviewProvider {
    static var previews: some View {
        Temperature()
    }
}
