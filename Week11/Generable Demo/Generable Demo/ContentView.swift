//
//  ContentView.swift
//  Generable Demo
//
//  Created by 이승준 on 11/22/25.
//

import SwiftUI
import FoundationModels
import Playgrounds

struct ContentView: View {
    let prompt = """
        Extract names, phone number, email, etc from the following description: I just met this wonderful woman named Tiffany Jones who has two children named Bob and Jane who are 10 and 8, respectively. Her phone is 1234567890 and email is tiffany@example.com. She is the CEO of a company called SoVeryCool.
        """
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var person = Person()
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Prompt")){
                    Text(prompt)
                    
                    Button{
                        Task {
                            await generatePersonFromDescription()
                        }
                        
                    } label: {
                        if isLoading{
                            ProgressView()
                        } else {
                            Text("Generate Person")
                                .bold()
                        }
                    }
                }
                
                if let error = errorMessage {
                    Section {
                        HStack(alignment: .top, spacing: 10){
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundStyle(.red)
                            VStack(alignment: .leading){
                                Text("Failed to generate response")
                                Text(error)
                            }
                            .font(.subheadline)
                        }
                    }
                }
                
                Section(header: Text("Person Description")) {
                    PersonView(person: person)
                }
            }
            .navigationTitle("Personal Details")
        }
    }
    
    private func generatePersonFromDescription() async {
        isLoading = true
        errorMessage = nil
        person = Person()
        do {
            let session = LanguageModelSession()
            let response = try await session.respond(to: prompt, generating: Person.self)
            person = response.content
        }catch{
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}

#Preview {
    ContentView()
}
