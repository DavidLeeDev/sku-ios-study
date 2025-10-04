//
//  PriceView.swift
//  Buy Now View
//
//  Created by 이승준 on 10/3/25.
//

import SwiftUI

struct PriceView: View {
    var price: Double
    var discountPercentage: Int?
    var discount: Double? {
        if let discountPercentage {
            return (Double(100 - discountPercentage) / 100) * price
        } else {
            return nil
        }
    }
    
    let discountColor: Color
    let bgColor: Color
    let yOffset: Double
    let discountAngle: Double
    
    init(
        price: Double,
        discountPercentage: Int? = nil,
        discountColor: Color = .blue,
        bgColor: Color = .red,
        yOffset: Double = -20,
        discountAngle: Double = -10
    ) {
        self.price = price
        self.discountPercentage = discountPercentage
        self.discountColor = discountColor
        self.bgColor = bgColor
        self.yOffset = yOffset
        self.discountAngle = discountAngle
    }
    
    var body: some View {
        VStack {
            if let discountPercentage{
                Text("\(discountPercentage)% OFF!")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                    .background(discountColor)
                    .clipShape(.rect(cornerRadius: 15))
                    .rotationEffect(Angle(degrees: discountAngle))
                    .offset(y: yOffset)
                    .shadow(radius: 5)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            HStack {
                Text("BUY NOW").font(.title).bold()
                
                Spacer()
                Text("$\(price, specifier: "%.2f")")
                    .foregroundStyle(.white)
                    .strikethrough(discount != nil)
                if let discount {
                    Text("$\(discount, specifier: "%.2f")").font(.title).fontWeight(.semibold)
                }
            }
            
        }
        .padding()
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 15).fill(bgColor)
                RoundedRectangle(cornerRadius: 15).stroke(.white)
            }
        )
    }
}

#Preview {
    ZStack {
        Color.black.opacity(0.7).ignoresSafeArea()
        VStack{
            PriceView(price: 20, discountPercentage: 75)
            
            PriceView(price: 20)
        }
    }
}


