//
//  ItemModel.swift
//  ToDoList
//
//  Created by Septia Rosalina Malik on 02/03/22.
//

import Foundation

//immutable struct

struct ItemModel: Identifiable, Codable{
    var id: String
    let title: String
    let isCompleted : Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = UUID().uuidString
        self.title = title
        self.isCompleted = isCompleted
    }
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}


