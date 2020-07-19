//
//  CoreDataManager.swift
//  NYTimes
//
//  Created by Загребельский Валентин on 17.07.2020.
//  Copyright © 2020 Загребельский Валентин. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    func saveData(_ object: ArticleModel) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Article", in: context)
        let artObject = NSManagedObject(entity: entity!, insertInto: context) as! Article
        
        artObject.abstract = object.abstract
        artObject.adx_keywords = object.adx_keywords
        artObject.asset_id = Int64(object.asset_id)
        artObject.byline = object.byline
        artObject.column = object.column
        artObject.des_facet = object.des_facet as NSObject
        artObject.eta_id = Int64(object.eta_id)
        artObject.geo_facet = object.geo_facet as NSObject
        artObject.id = Int64(object.id)
        artObject.nytdsection = object.nytdsection
        artObject.org_facet = object.org_facet as NSObject
        artObject.per_facet = object.per_facet as NSObject
        artObject.published_date = object.published_date
        artObject.section = object.section
        artObject.source = object.source
        artObject.subsection = object.subsection
        artObject.title = object.title
        artObject.type = object.type
        artObject.update = object.updated
        artObject.uri = object.uri
        artObject.url = object.url
        
        let html = try! String(contentsOf: URL(string: artObject.url!)!, encoding: .utf8)

        artObject.htmlData = html
        
        do {
            try context.save()
            print("Successful saving!")
        } catch {
            print("Saving  error")
        }
    }
    func fetchData(_ array: inout [Article]) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<Article> = Article.fetchRequest()
        
        print(array.count)
        do {
            array = try context.fetch(fetchRequest)
            print("Successful Fetching!")
            print(array.count)

        } catch {
            print("Fetch  error")
        }
    }
    func deleteData(_ array: inout [Article], element: Article) {
        let appDelegateAcc = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegateAcc.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Article> = Article.fetchRequest()
        context.delete(element)
        
        array.remove(at: array.firstIndex(of: element)!)
        
        do {
            try context.save()
            print("Successful removing!")
            print(try! context.fetch(fetchRequest).count)
        } catch {
            print("Removing error")
        }
    }
}


