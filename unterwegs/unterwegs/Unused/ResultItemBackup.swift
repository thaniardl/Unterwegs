//
//  ResultItemBackup.swift
//  unterwegs
//
//  Created by THANIA ARDILLA on 14/07/23.
//

import SwiftUI

struct ResultItemBackup: View {
    var body: some View {
                VStack{
                    HStack(alignment: .top) {
                        VStack(alignment: .leading){
                            Text("AT 09:00 AM")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.leading)
                            Text("Apple Foundation")
                                .fontWeight(.bold)
                            HStack {
                                Text("Nongsa Digital Park")
                                    .font(.caption2)
                                //           .multilineTextAlignment(.leading)
                                Image(systemName: "location")
                                Spacer()
                            }
                        }
                        VStack {
                            Image(systemName: "cloud")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                            Text("Cloudy")
                        }
                    }
                    .padding()
                    .padding(.vertical)
        
                    Text("you need to go at")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("30 Minutes")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Time left!")
                        .font(.headline)
                        .fontWeight(.regular)
        
                    Spacer()
        
                    Divider()
                        .frame(width: 300.0)
                        .background(Color.black)
        
                    Spacer()
        
                    Text("Cloudy conditions expected around 09:00 AM")
                        .font(.caption2)
        
                    Spacer()
                }
                .frame(width: 350.0, height: 300.0)
                .background(Rectangle().stroke())
            }
        }
struct ResultItemBackup_Previews: PreviewProvider {
    static var previews: some View {
        ResultItemBackup()
    }
}
