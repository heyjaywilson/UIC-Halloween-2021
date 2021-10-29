//
//  ContentView.swift
//  halloween-challenge
//
//  Created by Maegan Wilson on 10/29/21.
//

import SwiftUI

struct ContentView: View {
    @State private var cart = Cart()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(StoreItems) { item in
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
                            Spacer()
                            HStack{
                                Text("Price: \(getPriceInLocale(item.price))")
                            }
                        }
                        Spacer()
                        Button(action: {cart.addItemToCart(item)}) {
                            Image(systemName: "cart.fill.badge.plus")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color.orange)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Halloween Store"))
            .navigationBarItems(trailing: Button(action: {
                print("Open Cart")
            }, label: {
                Text("Cart Total \(getPriceInLocale(cart.total))")
            }))
        }
    }
    
    func getPriceInLocale(_ price: Double) -> String{
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        if let formattedPrice = formatter.string(from: price as NSNumber) {
            return formattedPrice
        }
        return "No price available"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
