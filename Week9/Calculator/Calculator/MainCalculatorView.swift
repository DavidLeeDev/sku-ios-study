//
//  ContentView.swift
//  Calculator
//
//  Created by 이승준 on 11/8/25.
//

import SwiftUI

struct MainCalculatorView: View {
    @State var lightMode: Bool = true
    
    @State var currentComputation: String = ""
    @State var mainResult: String = "0"
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                primaryBackgroundColor.ignoresSafeArea()
                
                VStack {
                    SunMoonView(lightMode: lightMode)
                        .onTapGesture {
                            withAnimation{
                                lightMode.toggle()
                            }
                        }
                    
                    Spacer()
                    
                    ComputationView(
                        currentComputation: currentComputation, mainResult: mainResult)
                    .padding(.horizontal, UIDevice.isIPad ? geometry.size.width * 0.1 : 0)
                    
                    Spacer()
                    
                    CalcsButtonView(
                        currentComputation: $currentComputation,
                        mainResult: $mainResult,
                        width: geometry.size.width)
                    
                    if UIDevice.isIPad {
                        Spacer()
                    }

                }
                .padding()
            }
        }
        .environment(\.colorScheme,
          lightMode ? .light : .dark
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainCalculatorView()
    }
}


#Preview {
    MainCalculatorView()
}
