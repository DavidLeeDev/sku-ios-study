//
//  OpenURLAction Demo.swift
//  Text Exploration
//
//  Created by 이승준 on 10/18/25.
//

import SwiftUI

struct OpenURLAction_Demo: View {
    let fontAwesome = "*[Font awesome](https://fontawesome.com/)*"
    @State private var visits = 0
    let maxVisits = 4
    var visitMe: String {
        switch(visits) {
        case 0: return "Check out \(fontAwesome) for some great fonts."
        case 1: return "Glad you are using \(fontAwesome)"
        case 2: return "Using \(fontAwesome)? Please leave a review."
        case 3...maxVisits: return "\(fontAwesome)"
        default: return "No more font awesome, let's get back to coding"
        }
    }
    
    @State private var actOfKindnessURLFromGoogle = "*[Acts Of Kindness](https://www.google.com)*"
    
    @State private var actOfKindnessURL = "*[Another Act of Kindness](https:/www.naver.com)*"
    
    @State private var showingAlert = false
    var body: some View {
        Form{
            Text(LocalizedStringKey(visitMe)).environment(\.openURL,OpenURLAction{
                url in
                visits += 1
                return .systemAction
            })
            .tint(.red)
            
            Text(LocalizedStringKey(actOfKindnessURL)).environment(\.openURL, OpenURLAction{
                url in
                if url.absoluteString.count < 12 || url.absoluteString.contains("bit.ly"){
                    print("suspicious email")
                    return .discarded
                } else if visits < 2 {
                    return .systemAction
                } else if let url = URL(string: "https://www.udemy.com"){
                    return .systemAction(url)
                } else {
                    return .handled
                }
            })
            .tint(.red)
            Text(LocalizedStringKey(actOfKindnessURLFromGoogle)).environment(\.openURL, OpenURLAction{
                url in
                if url.absoluteString.contains("google"){
                   // print("google has been blocked")
                    showingAlert = true
                    return .handled
                } else {
                    return .systemAction
                }
            })
            .tint(.green)
            
            Text("showingAlert: \(showingAlert.description)").font(.largeTitle)
        }
        .tint(.secondary)
        .bold()
        .foregroundStyle(.blue)
        .font(.title)
        .alert("Google is blocked", isPresented: $showingAlert){
            Button("Ok", role: .cancel){}
        }
        .onChange(of: showingAlert){oldValue, newValue in
            print("showingAlert: \(showingAlert.description)")
        }
    }
}

#Preview {
    OpenURLAction_Demo()
}
