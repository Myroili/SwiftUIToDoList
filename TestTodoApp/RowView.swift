//
//  RowView.swift
//  TestTodoApp
//
//  Created by Myroili on 8/27/19.
//  Copyright © 2019 Myroili. All rights reserved.
//

import SwiftUI

struct RowView: View {
    var title:String = ""
     var createdAt:String = ""
    
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(title).font(.headline)
                Text(createdAt).font(.caption)
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(title: "Hello", createdAt: "Hy")
    }
}
