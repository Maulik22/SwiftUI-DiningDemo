//
//  FavoriteView.swift
//  iDine
//
//  Created by Maulik Bhuptani on 24/06/21.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var favorite: Favorite

    func deleteItems(at offsets: IndexSet) {
        favorite.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            List{
                Section {
                    ForEach(favorite.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .navigationTitle("Favorite")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                EditButton()
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView().environmentObject(Favorite())
    }
}
