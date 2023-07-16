//
//  tryResultItem.swift
//  unterwegs
//
//  Created by THANIA ARDILLA on 15/07/23.
//

import SwiftUI


struct ResultItemm: View {

    @State private var activityName: String = "Apple Foundation"
    @State private var timeDesc: String = "Your departure time is"
    @State private var timeToGo: String = "40"
    @State private var activityLocation: String = "Nongsa Digital Park"
    @State private var activitytime: String = "08.00 AM"
    @State private var weaterInfo = ["☁️", "☀️", "🌧️"]
    
    var activity: Activity

    
    var body: some View {
        ZStack {            
            ZStack {
                VStack(spacing: -10) {
                    Text("\(activity.name)")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                        .frame(width: 300, height: 35)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(16)
                        .padding()
                    
                    VStack {
                        Text ("Your departure time is")
                            .font(.caption2)
                        Text("\(timeToGo) minutes")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    .frame(width: 300, height: 90)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
                    
                    HStack(spacing: 70) {
                        VStack(alignment: .leading){
                            HStack {
                                Image(systemName: "cloud")
                                    .resizable()
                                    .frame(width: 28, height: 22)
                                Text("28°")
                            }
                            HStack {
                                Text("\(activity.location)")
                                    .font(.caption2)
                                    .multilineTextAlignment(.leading)
                                Image(systemName: "location")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 11, height: 11)
                            }
                            Text("at \(activity.formattedTime)")
                                .font(.caption2)
                                .multilineTextAlignment(.leading)
                        }
                        
                        VStack(alignment: .center){
                            CountdownTimer(width: 50, height: 50, fontSize: 15, lineWidth: 9)
                            Text("time left to go")
                                .font(.caption)
                        }
                        
                    }
                    .frame(width: 300, height: 90)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
                    .padding()
                }
                .padding(-1)
            }
            .foregroundColor(Color("indigoMain"))
            .background(Color.white.opacity(0.5))
            .shadow(radius: 400)
            .cornerRadius(10)
            .padding()
        }
    }
}

struct ResultItemm_Previews: PreviewProvider {
    static var previews: some View {
        ResultItemm(activity: Activity(name: "Activity Name", location: "Activity Location", date: Date()))
    }
}
