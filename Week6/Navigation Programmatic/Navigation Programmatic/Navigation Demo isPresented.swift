//
//  Navigation Demo isPresented.swift
//  Navigation Programmatic
//
//  Created by 이승준 on 10/11/25.
//

import SwiftUI

struct Navigation_Demo_isPresented: View {
    @State private var isAnimating = false
    @State private var navigate = false
    let duration = 3.0
    var body: some View {
        NavigationStack{
            VStack{
                Circle()
                    .trim(from: 0, to: isAnimating ? 1 : 0)
                    .stroke(.blue, lineWidth: 7)
                    .frame(width: 100, height: 100)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1)){
                            isAnimating = true
                        } completion: {
                            navigate = true
                        }
                    }
            }
            .navigationTitle("Loading...")
            .navigationDestination(isPresented: $navigate){
                NewView()
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    Navigation_Demo_isPresented()
}
