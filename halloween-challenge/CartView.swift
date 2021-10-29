//
//  CartView.swift
//  halloween-challenge
//
//  Created by Maegan Wilson on 10/29/21.
//

import SwiftUI

struct CartView: View {
    @Binding var cart: Cart
    var body: some View {
        VStack{
            List{
                ForEach(cart.items) { item in
                    HStack{
                        Image(item.imageName)
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                            .scaledToFit()
                            .background(Color.gray.opacity(0.5))
                            .cornerRadius(10.0)
                            .padding(.trailing)
                        
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.body)
                                .fontWeight(.heavy)
                            Spacer()
                            Text("Amt: \(item.quantity)")
                        }
                        Spacer()
                        VStack(alignment: .center){
                            Button(action: {
                                cart.addItemToCart(item)
                            }) {
                                Image(systemName: "cart.fill.badge.minus")
                                    .font(.largeTitle)
                                    .foregroundColor(Color.red)
                            }
                            Spacer()
                            Text("Cost: \(getPriceInLocale(item.price, quantity: item.quantity))")
                        }
                    }
                }
            }
        }
    }
    
    func getPriceInLocale(_ price: Double, quantity: Int) -> String{
        let totalPrice = price * Double(quantity)
        
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        if let formattedPrice = formatter.string(from: totalPrice as NSNumber) {
            return formattedPrice
        }
        return "No price available"
    }
}

struct CartView_Previews: PreviewProvider {
    @State static var cart = Cart(items: [StoreItem(imageName: "vampire", name: "Vampire", price: 50.0, quantity: 2), StoreItem(imageName: "black-cat", name: "Black Cat", price: 5.0, quantity: 2), StoreItem(imageName: "candy-apple", name: "Candy Apple", price: 0.5, quantity: 2)])
    static var previews: some View {
        CartView(cart: $cart)
    }
}
