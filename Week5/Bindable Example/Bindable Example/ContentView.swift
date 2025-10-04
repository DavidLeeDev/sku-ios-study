//
//  ContentView.swift
//  Environment Example
//
//  Created by 이승준 on 10/3/25.
//

import SwiftUI

@Observable
class PersonViewModel {
    var firstName: String = "David"
    var lastName: String = "Lee"
    
    var getName: String {
        return "\(firstName) \(lastName)"
    }
    
    func changePerson() {
        let names: [(String, String)] = [
            ("Big", "Bird"),
            ("Elmo", ""),
            ("Cookie", "Monster"),
            ("Oscar", "the Grouch"),
            ("Bert", ""),
            ("Ernie", ""),
        ]
        let randomName: (String, String) = names.randomElement() ?? ("", "")
        
        firstName = randomName.0
        lastName = randomName.1
    }
}

struct ContentView: View {
    @Environment(PersonViewModel.self) private var personViewModel
    var body: some View {
        @Bindable var personViewModel = personViewModel
        
        VStack {
            Text(personViewModel.getName)
            
            TextField("Some Title",
                      text: $personViewModel.firstName)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Change Person", action: {
                personViewModel.changePerson()
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(PersonViewModel())
}
