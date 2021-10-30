//
//  ConfettiView.swift
//  halloween-challenge
//
//  Created by Maegan Wilson on 10/30/21.
//

import SwiftUI

struct ConfettiView: View {
    var items: [StoreItem]
    
    var body: some View {
        ZStack{
            ForEach(items) { item in
                Image(item.imageName)
                    .resizable()
                    .frame(width: 75.0, height: 75.0, alignment: .center)
                    .modifier(ParticlesModifier())
                    .offset(x: CGFloat(Double.random(in: -60...100)), y : CGFloat(Double.random(in: -70...70)))
            }
        }
    }
}

struct ConfettiView_Previews: PreviewProvider {
    static var previews: some View {
        ConfettiView(items: [
            StoreItem(imageName: "vampire", name: "Vampire", price: 50.0),
            StoreItem(imageName: "black-cat", name: "Black Cat", price: 5.0),
            StoreItem(imageName: "candy-apple", name: "Candy Apple", price: 0.5),
            StoreItem(imageName: "candy-tree", name: "Candy Tree", price: 500.0),
            StoreItem(imageName: "frankenstein", name: "Frankenstein Look A Like", price: 500.0),
            StoreItem(imageName: "ghost", name: "Ghost", price: 10.0),
            StoreItem(imageName: "haunted-tree", name: "Haunted Tree", price: 1000.0),
            StoreItem(imageName: "jackolantern", name: "Jack-o-lantern", price: 29.99),
            StoreItem(imageName: "owl", name: "Owl", price: 30.0),
            StoreItem(imageName: "scary-scare-crow", name: "Scare Crow", price: 500.0),
            StoreItem(imageName: "spider", name: "Spoopy Spider", price: 499.99),
            StoreItem(imageName: "stabbed-toy", name: "Scary Toy", price: 5.98),
            StoreItem(imageName: "stump", name: "Scary Stump", price: 155.0),
            StoreItem(imageName: "well", name: "Well Well Well", price: 400.0),
            StoreItem(imageName: "witch", name: "Wicked Witch", price: 9900.0)
        ])
    }
}
