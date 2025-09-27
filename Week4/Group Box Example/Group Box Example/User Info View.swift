//
//  User Info View.swift
//  Group Box Example
//
//  Created by 이승준 on 9/27/25.
//

import SwiftUI

struct User_Info_View: View {
    let name: String
    let email: String
    let phone: String
    let address: String
    var body: some View {
        GroupBox(
            content: {
                VStack(alignment:.leading){
                    Text("Name: \(name)")
                    Text("Email: \(email)")
                    
                    GroupBox(
                        content: {
                            VStack(alignment: .leading){
                                Text("Phone: \(phone)")
                                Text("Address: \(address)")
                            }
                        },
                        label: {
                            Label("Contact Info", systemImage: "phone.circle")
                        }
                        
                    ).padding()
                }
            },
            label: {
                Label("User Info", systemImage: "person.crop.circle")
            }
        )
    }
}

#Preview {
    User_Info_View(name: "John Doe", email: "johndoe@email.com", phone: "+1 234 566 8901", address: "123 main St, Anytown, USA")
}
