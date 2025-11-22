//
//  PersonView.swift
//  Generable Demo
//
//  Created by 이승준 on 11/22/25.
//

import SwiftUI

struct PersonView: View {
    let person: Person
    var body: some View {
        Section(header: Label("Contact Info", systemImage: "person.fill")){
            if !person.firstName.isEmpty {
                Text("First Name: \(person.firstName)")
            }
            if !person.lastName.isEmpty {
                Text("Last Name: \(person.lastName)")
            }
            if !person.phone.isEmpty {
                Label(person.phone, systemImage: "phone.fill")
            }
            if !person.email.isEmpty {
                Label(person.email, systemImage: "envelope.fill")
            }
        }
        
        if !person.company.isEmpty || !person.title.isEmpty {
            Section(header: Label("Work Info", systemImage: "briefcase.fill")){
                if !person.title.isEmpty {
                    Text("Title: \(person.title)")
                }
                if !person.company.isEmpty {
                    Text("Company: \(person.company)")
                }
            }
        }
        if !person.children.isEmpty{
            Section(header: Label("Children", systemImage: "person.2.fill")){
                ForEach(person.children){
                    child in
                    VStack(alignment: .leading){
                        if !child.name.isEmpty {
                            Text("Name: \(child.name)")
                        }
                        if child.age != 0 {
                            Text("Age: \(child.age)")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Form{
        PersonView(
            person: .init(
                firstName: "Tiffany",
                lastName: "Jones",
                phone: "12234",
                email: "some@example.com",
                children: [.init(name: "Someone", age: 23)],
                company: "Amazing Company",
                title: "CEO"
            )
        )

    }
}
