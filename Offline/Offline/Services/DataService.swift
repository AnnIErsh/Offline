//
//  DataService.swift
//  Offline
//
//  Created by Anna Ershova on 06.06.2022.
//

import Foundation
import CoreData

protocol IDataService {
    func encodeData<T: Codable>(type: T.Type, withData data: T?) -> Data?
    func decodeData<T: Codable>(type: T.Type, withData data: Data?) -> T?
    func saveData()
}

class DataService: IDataService {
    var context: NSManagedObjectContext?
    
    private var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: ModelNames.name)
        container.loadPersistentStores { descrip, error in
            if let error = error {
                print("error with container: ", error.localizedDescription)
            }
        }
        return container
    }()
    
    init() {
        self.context = container.viewContext
    }
    
    func saveData() {
        if let _ = context?.hasChanges {
            do { try context?.save() }
            catch {
                context?.rollback()
                fatalError("Unresolved error")
            }
        }
        print("data saved")
    }
    
    func encodeData<T: Codable>(type: T.Type, withData data: T?) -> Data? {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(data) {
            print("encoded data")
            return encoded
        }
        return nil
    }
    
    func decodeData<T: Codable>(type: T.Type, withData data: Data?) -> T? {
        let decoder = JSONDecoder()
        if let data = data {
            if let content = try? decoder.decode(T.self, from: data) {
                print("decoded data")
                return content
            }
        }
        return nil
    }
}
