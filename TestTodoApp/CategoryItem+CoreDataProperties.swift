//
//  CategoryItem+CoreDataProperties.swift
//  TestTodoApp
//
//  Created by Myroili on 8/28/19.
//  Copyright © 2019 Myroili. All rights reserved.
//
//

import Foundation
import CoreData


extension CategoryItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryItem> {
        let request:NSFetchRequest<CategoryItem> =  NSFetchRequest<CategoryItem>(entityName: "CategoryItem")
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        return request
    }

    @NSManaged public var category: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var image: Data?
    @NSManaged public var title: String?

}



