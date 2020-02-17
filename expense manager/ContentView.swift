//
//  ContentView.swift
//  expense manager
//
//  Created by Mac on 2/15/20.
//

import SwiftUI
import Combine
import RealmSwift



struct ContentView: View {
    @State private var isActive = false
    var categories: Results<Catagory>?
    init() {
        let realm = try! Realm()
        
        categories = realm.objects(Catagory.self)
        
    }
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AddCategoryView(), isActive: $isActive){
                    Text("")
                }
                List(self.categories!) { category in
                    Text(category.name)
                }
            }
        .navigationBarTitle("All Categories")
        .navigationBarItems(trailing:
            Button(action: {
                self.isActive = true
                print("clicked")
                
            }, label: {
                Image(systemName: "plus")
            }).buttonStyle(PlainButtonStyle())
        )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
