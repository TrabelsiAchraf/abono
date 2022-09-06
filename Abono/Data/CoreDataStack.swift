//
//  CoreDataStack.swift
//  Abono
//
//  Created by Achraf Trabelsi on 28/08/2022.
//

import CoreData

final class CoreDataStack {
    private let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    lazy var managedContext: NSManagedObjectContext = storeContainer.viewContext
    
    func saveContext() {
        guard managedContext.hasChanges else { return }
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    func fetchAll<T: NSManagedObject>(entity: T.Type) -> [T]? {
        do {
            let fetchRequest = NSFetchRequest<T>(entityName: T.description())
            let objects = try managedContext.fetch(fetchRequest)
            return objects
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
        return nil
    }
}

final class PersistenceManager {

    static let shared = PersistenceManager()

    lazy var coreDataStack: CoreDataStack = .init(modelName: "Abono")
}
