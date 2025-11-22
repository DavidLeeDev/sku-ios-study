//
//  ContentView.swift
//  FoundationsModel Warming Up
//
//  Created by 이승준 on 11/22/25.
//

import SwiftUI
import Playgrounds
import FoundationModels

#Playground {
    let instructions = """
        Create an rgb based color based on the following mood.
        """
    let session = LanguageModelSession(instructions: instructions)
    
    do {
        let mood = "Sunset"
        let answer = try await session.respond(to: mood)
    }catch{
        print(error.localizedDescription)
    }
}

struct ItemQueryView: View {
    @State private var itemName = "fruit"
    @State private var quantity: Double = 3
    var invalidItemName: Bool {
        itemName.count < 3
    }
    @State private var errorMessage: String?
    @State private var isLoading = false
    @State private var responseString: String = ""
    var prompt: String {
        if itemName.count < 3 {
            return ""
        } else {
            return quantity == 1 ? "please name \(quantity.formatted()) type of \(itemName)" : "Please name \(quantity.formatted()) types of \(itemName)"
        }
    }
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                VStack(spacing: 16) {
                    TextField("Item name", text: $itemName)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                    VStack(spacing: 8){
                        Text("Quantity: \(quantity.formatted())")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Slider(
                            value: $quantity,
                            in: 1...10,
                            step: 1
                        ).padding(.horizontal)
                    }
                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 16))
                .shadow(radius: 4)
                
                Text(prompt)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Button {
                    Task {
                        await generateItems()
                    }
                } label: {
                    Label("Generate", systemImage: "wand.and.stars").bold()
                }
                .buttonStyle(.glassProminent)
                .controlSize(.large)
                .padding(.top)
                .disabled(invalidItemName)
                
                if !responseString.isEmpty {
                    GroupBox {
                        VStack(alignment: .leading, spacing: 8){
                            Text("Model Response")
                                .font(.headline)
                                .foregroundStyle(.primary)
                            if errorMessage != nil {
                                Text("Something went wrong")
                                    .foregroundStyle(.red)
                                    .padding()
                            } else {
                                ScrollView{
                                    Text(LocalizedStringKey(responseString))
                                        .padding(.top, 4)
                                        .frame(maxWidth: .infinity,
                                               alignment: .leading)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Item Generator")
        }
    }
    
    private func generateItems() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let session = LanguageModelSession()
            let response = try await session.respond(to: prompt)
            
            responseString = response.content
        }catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}

#Preview {
    ItemQueryView()
}
