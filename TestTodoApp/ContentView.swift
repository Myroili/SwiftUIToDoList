//
//  ContentView.swift
//  TestTodoApp
//
//  Created by Myroili on 8/27/19.
//  Copyright © 2019 Myroili. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: CategoryItem.fe) var categoryItems:FetchedResults<CategoryItem>
    @State private var newCategoryItem = ""
    
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("Whats Next?")){
                    HStack{
                        TextField("New item ...",text: self.$newCategoryItem)
                        Button(action: {
                            let categoryItem = CategoryItem(context: self.managedObjectContext)
                            categoryItem.title = self.newCategoryItem
                            categoryItem.createdAt = Date()
                            
                            do{
                                try self.managedObjectContext.save()
                            }catch{
                                print(error)
                            }
                            self.newCategoryItem = ""
                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                    
                }.font(.headline)
                Section(header: Text("To Do's")){
                    ForEach(self.categoryItems){ categoryItem in
                        RowView(title: categoryItem.title!, createdAt: "\(categoryItem.createdAt!)")
                    }.onDelete{indexSet in
                        let deleteItem = self.categoryItems[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        do{
                            try self.managedObjectContext.save()
                        }catch{
                            print(error)
                        }
                    }
                    
                }
               
            }.navigationBarTitle("Home")
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
