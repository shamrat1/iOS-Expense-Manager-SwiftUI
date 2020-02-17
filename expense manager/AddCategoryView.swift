//
//  AddCategoryView.swift
//  expense manager
//
//  Created by Mac on 2/16/20.
//

import SwiftUI
import RealmSwift
import Combine

class AddCatagory: ObservableObject {
    var didChange = PassthroughSubject<Void, Never>()
    static let icons = ["some","something"]
    var selectedIcon = 0 {
        didSet{
            update()
        }
    }
    func update(){
        print(AddCatagory.icons[selectedIcon])
        didChange.send(())
    }
}

struct AddCategoryView: View {
    @ObservedObject var addCatagory = AddCatagory()
    @State var name = ""
    
    var body: some View {
        
        VStack {
            Form {
                Section {
                    TextField("Name of the Catagory.",text: $name).textFieldStyle(PlainTextFieldStyle())
                    Picker(selection: $addCatagory.selectedIcon, label: Text("Select Image")){
                        ForEach(0..<AddCatagory.icons.count ){
                            Text(AddCatagory.icons[$0]).tag($0)
                        }
                    }
                }
                Section {
                    Button(action: {
                        let icon = AddCatagory.icons[self.addCatagory.selectedIcon]
                        let realm = try! Realm()
                        do{
                            let catagory = Catagory()
                            catagory.name = self.name
                            catagory.icon = icon
                            
                            try realm.write{
                                realm.add(catagory)
                            }
                            print("New Catagory added.")
                        }catch {
                            print("Failed to add new catagory.")
                        }
                        print("\(self.name) & \(icon)")
                    }, label: {
                        Text("Save")
                    })
                }
            }
        }
        
    }
}

struct AddCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoryView()
    }
}
