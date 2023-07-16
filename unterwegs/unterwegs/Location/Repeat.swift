//
//  Every.swift
//  unterwegs
//
//  Created by THANIA ARDILLA on 16/07/23.
//

import SwiftUI

struct Repeat: View {
    
    @State private var selectedItems: Set<String> = []
    
    let everyWeek = ["Every Sunday", "Every Monday", "Every Tuesday", "Every Wednesday", "Every Thrusday", "Every Friday", "Every Saturday"]

    var body: some View {
        
        NavigationView {
            List {
                ForEach(everyWeek, id: \.self) { item in
                    Button(action: {
                        toggleSelection(item)
                    }) {
                        MultipleSelectionRow(title: item, isSelected: isSelected(item))
                    }
                }
            }
        }
    }
    
    
    
    func isSelected(_ item: String) -> Bool {
        selectedItems.contains(item)
    }
    
    func toggleSelection(_ item: String) {
        if isSelected(item) {
            selectedItems.remove(item)
        } else {
            selectedItems.insert(item)
        }
    }
}

struct MultipleSelectionRow: View {
    let title: String
    let isSelected: Bool
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            if isSelected {
                Image(systemName: "checkmark")
                    .foregroundColor(.indigo)
            }
        }
        .contentShape(Rectangle()) // Set the content shape to the whole row
    }
}

struct Repeat_Previews: PreviewProvider {
    static var previews: some View {
        Repeat()
    }
}
