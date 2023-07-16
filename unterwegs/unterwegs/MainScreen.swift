//
//  TryOne.swift
//  unterwegs
//
//  Created by THANIA ARDILLA on 12/07/23.
//

import SwiftUI

struct MainScreen: View {
        
    @State private var distance: Double = 0

    @State private var activities: [Activity] = []
    @State private var isPresentingSheet: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State private var currentTime = Date()
    
    var showExtraButton: Bool {
        activities.isEmpty
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color("purpleMain")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
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
                            isPresentingSheet = true
                        }) {
                            Image(systemName: "plus.circle")
                                .padding(.top, 40)
                                .font(.title2)
                        }
                        .sheet(isPresented: $isPresentingSheet) {
                            AddActivity(activities: $activities, isPresentingSheet: $isPresentingSheet)
                        }
                    }
                    .padding()
                    ForEach(activities) { activity in
                        ResultItemm(activity: activity)
                    }
                }
                .sheet(isPresented: $isPresentingSheet) {
                    AddActivity(activities: $activities, isPresentingSheet: $isPresentingSheet)
                }
                
                if showExtraButton {
                    Spacer()
                    Text("let’s add your activity so we can remind you to be on time!")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 50)
                    Button(action: {
                        isPresentingSheet = true
                        handleButtonTapped()
                    }) {
                        Text("Get Started")
                            .foregroundColor(.white)
                            .frame(width: 270, height: 45)
                            .background(Color("indigoMain"))
                            .cornerRadius(22)
                        
                    }
                    .padding()
                    .navigationBarHidden(true)
                    .navigationBarTitleDisplayMode(.inline)
                    Spacer()
                }
            }
        }
    }
    func handleButtonTapped() {
        print("Button tapped")
    }
}

private func getCurrentDate() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM d yyyy"
    return formatter.string(from: Date())
}


struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
