//
//  ShoppingStore.swift
//  ElCarrito
//
//  Created by Dalvin Segura on 25/7/25.
//
import Foundation

class ShoppingStore: ObservableObject {
    @Published var lists: [ShoppingList] = []
    
    // SHOPPING LISTS
    
    func createList(name: String){
        lists.append(ShoppingList(name: name, items: []))
    }
    
    func addItem(itemName: String, quantity: Int = 1, to listId: UUID){
        guard let index = lists.firstIndex(where: {$0.id == listId}) else {return}
        
        let newItem = ShoppingItem(name: itemName, quantity: quantity, isCompleted: false)
        lists[index].items.append(newItem)
    }
    
    func deleteItem(in listId: UUID, itemId: UUID) {
        guard let listIndex = lists.firstIndex(where: { $0.id == listId }) else { return }

        lists[listIndex].items.removeAll { $0.id == itemId }
    }

    func toggleItem(in listId: UUID, itemId: UUID) {
        guard let listIndex = lists.firstIndex(where: { $0.id == listId }) else { return }

        if let itemIndex = lists[listIndex].items.firstIndex(where: { $0.id == itemId }) {
            lists[listIndex].items[itemIndex].isCompleted.toggle()
        }
    }

    
    
        
        

    

}
