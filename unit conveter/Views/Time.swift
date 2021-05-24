//
//  Time.swift
//  unit conveter
//
//  Created by kamal on 24/05/21.
//

import SwiftUI

struct Time: View {
    @State private var time = ""
    @State private var inputTimeFormat = 1
    @State private var outputTimeFormat = 2
    var timeFormat = ["seconds", "minutes", "hours", "days"]
    
    func convert() -> String {
        let temp = Double(time) ?? 0
        
        if time == "" {
            return ""
        }
        
        switch inputTimeFormat {
        case 0:
            switch outputTimeFormat {
            case 0:
                return String(format: "%.2f sec", temp)
            case 1:
                return String(format: "%.2f min", temp / 60)
            case 2:
                return String(format: "%.2f hour", temp / 3600)
            case 3:
                return String(format: "%.2f day", temp / 86400)
            default:
                return ""
            }
        case 1:
            switch outputTimeFormat {
            case 0:
                return String(format: "%.2f sec", temp * 60)
            case 1:
                return String(format: "%.2f min", temp)
            case 2:
                return String(format: "%.2f hour", temp / 60)
            case 3:
                return String(format: "%.2f day", temp / 1440)
            default:
                return ""
            }
        case 2:
            switch outputTimeFormat {
            case 0:
                return String(format: "%.2f sec", temp * 3600)
            case 1:
                return String(format: "%.2f min", temp * 60)
            case 2:
                return String(format: "%.2f hour", temp)
            case 3:
                return String(format: "%.2f day", temp / 24)
            default:
                return ""
            }
        case 3:
            switch outputTimeFormat {
            case 0:
                return String(format: "%.2f sec", temp * 86400)
            case 1:
                return String(format: "%.2f min", temp * 1440)
            case 2:
                return String(format: "%.2f hour", temp * 24)
            case 3:
                return String(format: "%.2f day", temp)
            default:
                return ""
            }
        default:
            return ""
        }
        
    }
    
    var body: some View {
        
        ZStack{
            Color(red: 0.88, green: 0.90, blue: 0.92, opacity: 1.00).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text("Input")
                    .font(.title)
                    .foregroundColor(.gray)
                
                Section {
                    TextField("Enter time", text: $time)
                        .padding()
                        .font(.system(size: 25))
                        .keyboardType(.numberPad)
                    Picker("Input Unit", selection: $inputTimeFormat) {
                        ForEach(0..<timeFormat.count) { i in
                            Text("\(timeFormat[i])")
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
                
                Section {
                    Picker("Output Unit", selection: $outputTimeFormat) {
                        ForEach(0..<timeFormat.count) { (i) in
                            Text(timeFormat[i])
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
                }.background(Color.white)
                .cornerRadius(12)
            }
        }
        
    }
}

struct Time_Previews: PreviewProvider {
    static var previews: some View {
        Time()
    }
}
