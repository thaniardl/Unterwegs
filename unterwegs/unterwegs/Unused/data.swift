//
//  data.swift
//  unterwegs
//
//  Created by THANIA ARDILLA on 14/07/23.
//

import SwiftUI

struct data: View {

        @State private var breakfastItems = ["Nasi Putih", "Ayam Goreng"]
        @State private var lunchItems = ["Nasi Goreng", "Ayam Panggang", "Cumi Hitam"]
        @State private var dinnerItems = ["Nasi Merah", "Steak"]

        var body: some View {
            NavigationView {
                VStack {
                    List {
                        Section(header: Text("Makan Pagi")) {
                            ForEach(breakfastItems, id: \.self) { item in
                                Text(item)
                            }
                            .onDelete(perform: deleteBreakfastItem)
                        }
                        
                        Section(header: Text("Makan Siang")) {
                            ForEach(lunchItems, id: \.self) { item in
                                Text(item)
                            }
                            .onDelete(perform: deleteLunchItem)
                        }
                        
                        Section(header: Text("Makan Malam")) {
                            ForEach(dinnerItems, id: \.self) { item in
                                Text(item)
                            }
                            .onDelete(perform: deleteDinnerItem)
                        }
                    }
                    .listStyle(GroupedListStyle())
                    
                    Button(action: {
                        addNewItem()
                    }) {
                        Text("Add New Item")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
                .navigationTitle("Meal Planner")
            }
        }
        
        func addNewItem() {
            let newItem = "New Item"
            breakfastItems.append(newItem)
        }
        
        func deleteBreakfastItem(at offsets: IndexSet) {
            breakfastItems.remove(atOffsets: offsets)
        }
        
        func deleteLunchItem(at offsets: IndexSet) {
            lunchItems.remove(atOffsets: offsets)
        }
        
        func deleteDinnerItem(at offsets: IndexSet) {
            dinnerItems.remove(atOffsets: offsets)
        }
    }



struct data_Previews: PreviewProvider {
    static var previews: some View {
        data()
    }
}
