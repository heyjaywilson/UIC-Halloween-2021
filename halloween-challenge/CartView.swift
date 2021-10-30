//
//  CartView.swift
//  halloween-challenge
//
//  Created by Maegan Wilson on 10/29/21.
//

import SwiftUI

struct CartView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var userCart: Cart
    
    @State private var showConfetti = false
    
    var body: some View {
        ZStack{
            switch showConfetti {
                case true:
                    Group{
                        ConfettiView(items: userCart.items)
                        Text("Purchase Successful!")
                            .font(.largeTitle)
                            .foregroundColor(Color.orange)
                            .padding()
                            .background(.ultraThickMaterial)
                            .cornerRadius(10.0)
                    }
                default:
                    VStack{
                        HStack{
                            Spacer()
                            Button("Close", action: {dismiss()})
                                .foregroundColor(.red)
                                .padding()
                        }
                        List{
                            ForEach(userCart.items) { item in
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
                                            userCart.removeItem(item)
                                        }) {
                                            Image(systemName: "cart.fill.badge.minus")
                                                .font(.largeTitle)
                                                .foregroundColor(Color.red)
                                        }
                                        Spacer()
                                        Text("Cost: \(getPriceInLocale(item.price, quantity: item.quantity))")
                                    }.frame(width: 90)
                                }
                            }
                        }
                        Button("Purchase", action: purchase)
                            .buttonStyle(BorderedProminentButtonStyle())

                    }
            }
        }
    }
    
    func purchase(){
        print("Purchase")
        showConfetti = userCart.purchaseCart()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
            print("done")
            dismiss()
        })
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
//    @State static var cart: Cart = Cart()
    
    static var previews: some View {
        CartView()
    }
}
