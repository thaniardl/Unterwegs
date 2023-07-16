//
//  SwiftUIView.swift
//  unterwegs
//
//  Created by THANIA ARDILLA on 05/07/23.
//

import SwiftUI

struct ResultScreen: View {
    
    @State private var isPresentingSheet: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State private var currentTime = Date()

    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(getCurrentDate())
                            .textCase(.uppercase)
                            .font(.footnote)
                            .bold()
                            .foregroundColor(Color("indigoLow"))
                        Text("Today ☁️")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color("indigoMain"))
                    }
            
                    Spacer()

                    Button(action: {
                    }) {
                        Image(systemName: "calendar.circle")
                            .padding(.top, 40)
                            .font(.title2)
                    }
                    Button(action: {
                        isPresentingSheet = true
                    }) {
                        Image(systemName: "plus.circle")
                            .padding(.top, 40)
                            .font(.title2)
                    }
                    .sheet(isPresented: $isPresentingSheet) {
                        AddActivity(activities: .constant([]), isPresentingSheet: $isPresentingSheet)
                    }
                }
                
                .padding(.horizontal)
                .padding(.vertical, 16)
                
                Spacer()
                
                .padding()
                .padding(.bottom, 250.0)
                .navigationBarHidden(true)
                .navigationBarTitleDisplayMode(.inline)
            }
            .sheet(isPresented: $isPresentingSheet) {
                AddActivity(activities: .constant([]), isPresentingSheet: $isPresentingSheet)
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color("purpleLow")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
                )
            )
    }
    func handleButtonTapped() {
        print("Button tapped")
    }
}

private func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        return formatter.string(from: Date())
    }


struct ResultScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResultScreen()
    }
}
