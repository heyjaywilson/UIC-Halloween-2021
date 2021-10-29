//
//  ContentView.swift
//  halloween-challenge
//
//  Created by Maegan Wilson on 10/29/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
                            Text("Price:\(getPriceInLocale(item.price))")
                        }
                    }
                }
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
