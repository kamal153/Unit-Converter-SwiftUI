//
//  Length.swift
//  unit conveter
//
//  Created by kamal on 23/05/21.
//

import SwiftUI

struct Length: View {
    
    @State private var length = ""
    @State private var inputUnit = 2
    @State private var outputUnit = 2
    var lengthUnits = ["meters", "kilometers", "feet", "yards", "miles"]
    
    func convert() -> String {
        let len = Double(length) ?? 0
        
        if length.count == 0 {
            return ""
        }
        
        switch inputUnit {
        case 0:
            switch outputUnit {
            case 0:
                return String(format: "%.2f m", len)
            case 1:
                return String(format: "%.2f km", len / 1000)
            case 2:
                return String(format: "%.2f ft", len * 3.281)
            case 3:
                return String(format: "%.2f yd", len * 1.094)
            case 4:
                return String(format: "%.2f mi", len / 1609)
            default:
                return ""
            }
        case 1:
            switch outputUnit {
            case 0:
                return String(format: "%.2f m", len * 1000)
            case 1:
                return String(format: "%.2f km", len)
            case 2:
                return String(format: "%.2f ft", len * 3281)
            case 3:
                return String(format: "%.2f yd", len * 1094)
            case 4:
                return String(format: "%.2f mi", len / 1.609)
            default:
                return ""
            }
        case 2:
            switch outputUnit {
            case 0:
                return String(format: "%.2f m", len / 3.281)
            case 1:
                return String(format: "%.2f km", len / 3281)
            case 2:
                return String(format: "%.2f ft", len)
            case 3:
                return String(format: "%.2f yd", len / 3)
            case 4:
                return String(format: "%.2f mi", len / 5280)
            default:
                return ""
            }
        case 3:
            switch outputUnit {
            case 0:
                return String(format: "%.2f m", len / 1.094)
            case 1:
                return String(format: "%.2f km", len / 1094)
            case 2:
                return String(format: "%.2f ft", len * 3)
            case 3:
                return String(format: "%.2f yd", len)
            case 4:
                return String(format: "%.2f mi", len / 1760)
            default:
                return ""
            }
        case 4:
            switch outputUnit {
            case 0:
                return String(format: "%.2f m", len * 1609)
            case 1:
                return String(format: "%.2f km", len * 1.609)
            case 2:
                return String(format: "%.2f ft", len * 5280)
            case 3:
                return String(format: "%.2f yd", len * 1760)
            case 4:
                return String(format: "%.2f mi", len)
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
                    TextField("Enter length", text: $length)
                        .padding()
                        .font(.system(size: 25))
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(0..<lengthUnits.count) { i in
                            Text("\(lengthUnits[i])")
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
                        ForEach(0..<lengthUnits.count) { i in
                            Text("\(lengthUnits[i])")
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

struct Length_Previews: PreviewProvider {
    static var previews: some View {
        Length()
    }
}
