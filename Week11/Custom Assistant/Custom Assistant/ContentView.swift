//
//  ContentView.swift
//  Custom Assistant
//
//  Created by 이승준 on 11/22/25.
//

import SwiftUI
import FoundationModels

struct ContentView: View {
    @State private var temperature = 0.7
    @State private var maximumResponseTokens: Double = 20.0
    @State private var question: String = ""
    @State private var reply: String = ""
    private var session: LanguageModelSession
    
    let instructions = """
        You are a helpful assistant.
        
        You have to strictly follow the following rules:
        -Your response should always be in markdown format.
        -You always use boldface for the first word of the response.
        """
    init() {
        self.session = LanguageModelSession(instructions: instructions)
    }
    var body: some View {
        NavigationStack {
            Form{
                Section("Ask the Assistant"){
                    TextField("Type your question here", text: $question)
                        .textFieldStyle(.roundedBorder)
                    
                    Button{
                        Task{
                            reply = try await respond(
                                userInput: question
                            )
                        }
                    } label: {
                        Label("Submit Question", systemImage: "Paperplane.fill")
                            .bold()
                    }.buttonStyle(.borderedProminent)
                }
                if !reply.isEmpty {
                    Section("Assistant's Reply"){
                        ScrollView{
                            Text(LocalizedStringKey(reply))
                                .padding(.vertical)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
                
                Section("Temperature"){
                    Slider(value: $temperature, in: 0...2, step: 0.01)
                    Text(temperature.formatted())
                }
                Section("Max Response Tokens"){
                    Slider(value: $maximumResponseTokens, in: 1...200, step: 1)
                    Text(maximumResponseTokens.formatted())
                }
            }
            .navigationTitle("AI Assistant")
        }
    }
    
    func respond(userInput: String) async throws -> String {
        let response = try await session.respond(to: userInput, options: .init(temperature: temperature, maximumResponseTokens: Int(maximumResponseTokens)))
        return response.content
    }
}

#Preview {
    ContentView()
}
