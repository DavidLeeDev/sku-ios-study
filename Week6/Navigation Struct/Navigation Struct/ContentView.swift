//
//  ContentView.swift
//  Navigation Struct
//
//  Created by 이승준 on 10/11/25.
//

import SwiftUI

struct Product: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let price: Double
}

struct ContentView: View {
    let products: [Product] = [
        .init(name: "iPhone", price: 999),
        .init(name: "MacBook", price: 1999),
        .init(name: "iPad", price: 599),
        
    ]
    var body: some View {
        NavigationStack {
            List(products){ product in
                NavigationLink(value: product) {
                    Text(product.name)
                        .bold()
                        .foregroundStyle(product.price < 1000 ? .blue : .red)
                }
            }
            .navigationDestination(for: Product.self){ product in
                VStack{
                    Text(product.name)
                        .font(.largeTitle)
                    Text("Price: $\(product.price, specifier: "%.2f")")
                }
            }
            .navigationTitle("Products")
        }
    }
}

#Preview {
    ContentView()
}
