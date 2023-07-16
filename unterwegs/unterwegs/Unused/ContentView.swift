//
//  ContentView.swift
//  unterwegs
//
//  Created by THANIA ARDILLA on 27/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Image("rectangle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .offset(x: 0, y: -73)
                //    RoundedRectangle(cornerRadius: 68)
                //        .fill(Color("purpleMain"))
                //        .frame(width: 414, height: 539)
                //       .offset(x: 0, y: -130)
                VStack(spacing: 0.5){
                    ZStack{
                        Circle()
                            .fill(Color("purpleIcon"))
                            .frame(width: 217, height: 227)
                            .offset(x: 0, y: 270)
                        Image("appIconTry")
                            .resizable()
                            .scaledToFit()
                            .frame(height:197)
                            .offset(x: 0, y: 270)
                        
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("Welcome!")
                        .font(.largeTitle)
                        .bold()
                    
                    TextField("yourname", text: $name)
                        .multilineTextAlignment(.center)
                        .frame(width: 300)
                    
                    Spacer()
             //       VStack{
                        NavigationLink {
        //                    ActivityView ()
                        } label: {
                            ContentViewNext(name: "Get Started")
                              //  .buttonStyle(.borderedProminent)
                       //         .buttonStyle(.borderless)
                             //   .buttonBorderShape(.capsule)
                                .navigationBarBackButtonHidden(false)
                                
                        }
                    }
                }
            }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
            
        }
    }
struct ContentViewNext: View {
    @State var name: String
    
    var body: some View {
        VStack(alignment: .leading) {
                Button("Get Started") {
                }
                .foregroundColor(.black)
                .frame(width: 260, height: 45)
                .background(Color("purpleLow"))
                .cornerRadius(22)
                .padding(.bottom, 60.0)
            }
        }
}

