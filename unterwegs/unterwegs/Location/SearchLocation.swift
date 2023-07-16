//
//  SearchLocation.swift
//  unterwegs
//
//  Created by THANIA ARDILLA on 15/07/23.
//

import SwiftUI
import CoreLocation
import Combine

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
}

class SearchBarObserver: ObservableObject {
    @Published var searchText: String = ""
    @Published var searchResults: [Location] = []
    
    private var geocoder: CLGeocoder = CLGeocoder()
    
    init() {
        // Memulai proses pencarian saat teks berubah
        $searchText
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] searchText in
                self?.searchLocation(searchText: searchText)
            }
            .store(in: &cancellables)
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    private func searchLocation(searchText: String) {
        geocoder.geocodeAddressString(searchText) { [weak self] (placemarks, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("Error geocoding: \(error.localizedDescription)")
                return
            }
            
            guard let placemarks = placemarks else {
                self.searchResults = []
                return
            }
            
            self.searchResults = placemarks.compactMap { placemark in
                guard let name = placemark.name,
                      let location = placemark.location else { return nil }
                
                return Location(name: name,
                                latitude: location.coordinate.latitude,
                                longitude: location.coordinate.longitude)
            }
        }
    }
}

struct LocationView: View {
    @StateObject private var searchBarObserver = SearchBarObserver()
    @State private var selectedLocation: Location? = nil
    @Binding var isPresentingSheetLocation: Bool

    
    var body: some View {
        NavigationView {
            List(searchBarObserver.searchResults) { location in
                VStack(alignment: .leading) {
                    Text(location.name)
                    Text("Latitude: \(location.latitude), Longitude: \(location.longitude)")
                        .font(.caption)
                }
                .onTapGesture {
                    selectedLocation = location
                }
            }
            .searchable(text: $searchBarObserver.searchText, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle("Search Locations")
            .navigationBarTitleDisplayMode(.inline)
            
            .sheet(item: $selectedLocation) { location in
                Text("Selected Location: \(location.name)")
                    .padding()
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(isPresentingSheetLocation: .constant(true))
    }
}

