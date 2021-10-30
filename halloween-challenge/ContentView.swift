//
//  ContentView.swift
//  halloween-challenge
//
//  Created by Maegan Wilson on 10/29/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userCart: Cart
    @State private var cart = Cart()
    @State private var showCart = false
    
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
                        Button(action: {
                            userCart.addItemToCart(item)
                        }) {
                            Image(systemName: "cart.fill.badge.plus")
                                .font(.largeTitle)
                                .foregroundColor(Color.orange)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Halloween Store"))
            .navigationBarItems(trailing: Button(action: {
                showCart.toggle()
            }, label: {
                Text("Cart Total \(getPriceInLocale(userCart.total))")
            }))
            .sheet(isPresented: $showCart){
                CartView()
                    .environmentObject(userCart)
            }
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
