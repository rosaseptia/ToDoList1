//
//  ListVewModel.swift
//  ToDoList
//
//  Created by Septia Rosalina Malik on 02/03/22.
//

import Foundation
//import SwiftUI

class ListViewModel: ObservableObject{
    
    @Published var items: [ItemModel] = []{
        didSet {
            saveItem()
        }
    }
    let itemKey: String = "item_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            ItemModel(title: "This is the first title!", isCompleted: false),
//            ItemModel(title: "this is second!", isCompleted: true),
//            ItemModel(title: "third!", isCompleted: false)
//        ]
//        items.append(contentsOf: newItems)
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self,from: data)
        else { return }
        self.items = saveItems
    }
    func deleteItem(indexSet : IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title:String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    func updateItem(item:ItemModel){
//        if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        }{
//            //run this code
//        }
        
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateCompletion()
        }
    }
    func saveItem() {
        if let encodeData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodeData, forKey: itemKey)
        }
        
    }
    
}

