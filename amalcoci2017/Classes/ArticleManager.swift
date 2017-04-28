//
//  ArticleManager.swift
//  Pods
//
//  Created by andreimalcoci on 4/27/17.
//
//

import CoreData

public class ArticleManager
{
    public var managedObjectContext: NSManagedObjectContext
    
    var bundle: Bundle;
    var mom :NSManagedObjectModel
    
    public init()
    {
        bundle = Bundle(for: Article.self)
        let url = bundle.url(forResource: "article", withExtension: "momd")!
        mom = NSManagedObjectModel(contentsOf: url)!
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        managedObjectContext = NSManagedObjectContext(concurrencyType:.mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = psc
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = urls[urls.endIndex-1]
        let storeURL = docURL.appendingPathComponent("article.xcdatamodeld")
        do {
            try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch {
            print("Error migrating store: \(error)")
        }
        
    }

    public func newArticle(_ title:String, _ content:String,_ lang:String?,_ image:NSData?,_ atCreate:NSDate?, _ atModefied : NSDate? ) -> Article
    {
        let entity = NSEntityDescription.entity(forEntityName: "Article", in: managedObjectContext)
        let article = NSManagedObject(entity: entity!,insertInto: managedObjectContext)
        
        article.setValue(title, forKey: "title")
        article.setValue(content, forKey: "content")
        article.setValue(lang, forKey: "lang")
        article.setValue(image, forKey: "image")
        article.setValue(atCreate, forKey: "atCreate")
        article.setValue(atModefied, forKey: "atModefied")
        
        return article as! Article
    }
  
    public func getAllArticles() -> [Article]
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        
        // Create Entity Description
        let entityDescription = NSEntityDescription.entity(forEntityName: "Article", in: self.managedObjectContext)
        
        // Configure Fetch Request
        fetchRequest.entity = entityDescription
        
        do {
            let result = try self.managedObjectContext.fetch(fetchRequest)
            return (result as? [Article])!
            
        } catch {
            return []
        }
    }

    public func getArticles(withLang lang : String) -> [Article]
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        
        // Create Predicate
        let predicate = NSPredicate(format: "%K == %@", "lang", lang)
        fetchRequest.predicate = predicate
        
        // Execute Fetch Request
        do {
            let result = try self.managedObjectContext.fetch(fetchRequest)
            return (result as? [Article])!
            
        } catch {
            _ = error as NSError
            return []
        }
    }
    
    public func getArticles(containString str : String) -> [Article]
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        
        // Create Predicate
        let predicate = NSPredicate(format: "content CONTAINS %@ OR title CONTAINS %@", str)
        fetchRequest.predicate = predicate
        
        // Execute Fetch Request
        do {
            let result = try self.managedObjectContext.fetch(fetchRequest)
            return (result as? [Article])!
            
        } catch {
            _ = error as NSError
            return []
        }
        
    }
    
    public func removeArticle(article : Article)
    {
        managedObjectContext.delete(article)
    }
    
    public func save()
    {
        do {
            try managedObjectContext.save()
        }
        catch {
            print("Error save()")
        }
    }

}
