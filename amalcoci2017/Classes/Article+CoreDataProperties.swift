//
//  Article+CoreDataProperties.swift
//  
//
//  Created by andreimalcoci on 4/28/17.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article");
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var image: NSData?
    @NSManaged public var lang: String?
    @NSManaged public var atCreate: NSDate?
    @NSManaged public var atModefied: NSDate?
    
    public override var description: String
        {
            return "\(title)"
    }

}
