//
//  Person.swift
//  Generable Demo
//
//  Created by 이승준 on 11/22/25.
//

import Foundation
import FoundationModels

@Generable
struct Person {
    @Guide(description: "Extract first name from description. If you cannot extract then use an empty string.")
    let firstName: String
    @Guide(description: "Extract last name from description. If you cannot extract then use an empty string.")
    let lastName: String
    @Guide(description: "Extract phone number from description. If you cannot extract then use an empty string.")
    let phone: String
    @Guide(description: "Extract email address from description. If you cannot extract then use an empty string.")
    let email: String
    @Guide(description: "Extract a list of children from description. This will include names and ages. If you cannot extract then any partial data found.")
    let children: [Child]
    @Guide(description: "Extract company name from description. If you cannot extract then use an empty string.")
    let company: String
    @Guide(description: "Extract title of person working at the company in the description. If you cannot extract then use an empty string.")
    let title: String
    
    init(){
        self.firstName = ""
        self.lastName = ""
        self.children = []
        self.phone = ""
        self.email = ""
        self.company = ""
        self.title = ""
    }
    init(firstName: String, lastName: String, phone: String, email: String, children: [Child], company: String, title: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
        self.email = email
        self.children = children
        self.company = company
        self.title = title
    }
}

@Generable
struct Child: Identifiable {
    let id = UUID()
    @Guide(description: "Extract child's name from description. If you cannot extract then use an empty string.")
    let name: String
    
    @Guide(description: "Extract the age of the child from description. If you cannot extract then use the value zero.")
    let age: Int
}
