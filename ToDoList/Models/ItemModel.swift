//
//  ItemModel.swift
//  ToDoList
//
//  Created by Septia Rosalina Malik on 02/03/22.
//

import Foundation

struct ItemModel: Identifiable{
    var id: String = UUID().uuidString
    let title: String
    let isCompleted : Bool
}
