//
//  ItemDetail.swift
//  iDine
//
//  Created by Maulik Bhuptani on 24/06/21.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorite: Favorite

    let item: MenuItem
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage).resizable().scaledToFit()
                Text("Photo: \(item.photoCredit)").padding(4).background(Color.black)
                                    .font(.caption)
                                    .foregroundColor(.white)    .offset(x: -5, y: -5)
            }
            Text(item.description).padding()
            Button("Order This") {
                order.add(item: item)
            }
            .font(.headline)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Favorite") {
                favorite.add(item: item)
            }
        }
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(Order())
        }
    }
}
