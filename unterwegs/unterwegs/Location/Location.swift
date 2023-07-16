////
////  Location.swift
////  unterwegs
////
////  Created by THANIA ARDILLA on 12/07/23.
////
//
//import SwiftUI
//
//struct LocationView: View {
//
//    //    @State private var searchText = ""
//    @Binding var isPresentingSheetLocation: Bool
//    //
//    //
//    //    var body: some View {
//    //                NavigationStack {
//    //                    Text("Searching for \(searchText)")
//    //                        .navigationTitle("Location")
//    //                        .navigationBarTitleDisplayMode(.inline)
//    //                }
//    //                .searchable(text: $searchText)
//    //            }
//    //        }
//
//    let places = ["Nongsa Digital Park", "Institut Teknologi Batam"]
//    @State private var searchText = ""
//
//    var body: some View {
//        NavigationStack {
//            List {
//                ForEach(searchResults, id: \.self) { place in
//                    NavigationLink {
//                    } label: {
//                        Text(place)
//                    }
//                }
//            }
//                .searchable(text: $searchText)
//                .navigationTitle("Location")
//                .navigationBarTitleDisplayMode(.inline)
//
//        }
//        .searchable(text: $searchText)
//    }
//
//    var searchResults: [String] {
//        if searchText.isEmpty {
//            return places
//        } else {
//            return places.filter { $0.contains(searchText) }
//        }
//    }
//}
//
//struct LocationView_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationView(isPresentingSheetLocation: .constant(true))
//    }
//}
