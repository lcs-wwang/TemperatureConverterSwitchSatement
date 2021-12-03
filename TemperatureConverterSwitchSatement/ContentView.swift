//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Russell Gordon on 2021-11-30.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    @State var temperatureInCelsius = 0.0
    
    // MARK: Computed properties
    // property the logic goes here
    var temperatureInFahrenheit: Double {
        return temperatureInCelsius * 1.8 + 32
    }
    // to provide suggestion of what to wear based on temp
    var feedback:String{
        if temperatureInCelsius >= -50.0 && temperatureInCelsius < -20.0 {
            return "It's freezing outside! 🥶"
        } else if temperatureInCelsius >= -20.0 && temperatureInCelsius < 0.0 {
            return "Dress warmly!"
        } else if temperatureInCelsius >= 0.0 && temperatureInCelsius < 10.0 {
            return "Need a coat!"
        } else if temperatureInCelsius >= 10.0 && temperatureInCelsius < 20.0 {
            return "Not very cold, not very hot... Perfect!"
        } else if temperatureInCelsius >= 20.0 && temperatureInCelsius < 30.0 {
            return "Warm weather! Wear thin layers."
        } else {
            return "Never go out! It's too hot. 🥵"
        }
    }
    //"body" property is only for input and output
    var body: some View {
        
        VStack {

            HStack {
                Text("Celsius")
                    .bold()

                Spacer()
            }
            
            // Input: Temperature in Celsius
            Slider(value: $temperatureInCelsius,
                   in: -50.0...50.0,
                   step: 0.1,
                   label: {
                Text("Celsius")
            },
                   minimumValueLabel: {
                Text("-50")
            },
                   maximumValueLabel: {
                Text("50")
            })
            
            // Output: Temperature in Celsius
            Text("\(String(format: "%.1f", temperatureInCelsius)) °C")
                .bold()
                .padding()
            
            HStack {
                Text("Fahrenheit")
                    .bold()
                
                Spacer()
            }

            // Output: Temperature in Fahrenheit
            Text("\(String(format: "%.1f", temperatureInFahrenheit)) °F")
                .bold()
                .padding()
            
            //output: what to wear
             
            
            Text(feedback)
            
            
            Spacer()

        }
        .padding()
        .navigationTitle("Temperature Converter")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
