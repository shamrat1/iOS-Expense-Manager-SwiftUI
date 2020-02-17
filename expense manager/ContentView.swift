//
//  ContentView.swift
//  expense manager
//
//  Created by Mac on 2/15/20.
//

import SwiftUI
import Combine
import RealmSwift

class FetchCategories: ObservableObject {

   @Published var allCategories: Results<Catagory>?
    
    func getCategories(){
      let realm = try! Realm()
      allCategories = realm.objects(Catagory.self)

   }
}
struct ContentView: View {
    @State private var isActive = false
    @ObservedObject var categories = FetchCategories()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AddCategoryView(), isActive: $isActive){
                    Text("")
                }
                List() {
                    ForEach(categories.allCategories!){ category in
                        Text(category.name)
                    }.onDelete(perform: self.delete)
                    
                }.onAppear(perform: categories.getCategories)
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
    private func delete(at indexSet: IndexSet){
        let realm = try! Realm()
        var index = 0
        indexSet.forEach {
            index = $0
        }
        do {
            try realm.write{
                realm.delete(categories.allCategories![index])
                print("deleted")
//                categories.getCategories()
            }
        } catch {
            print(error)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
