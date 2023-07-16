////
////  AddActivity.swift
////  unterwegs
////
////  Created by THANIA ARDILLA on 08/07/23.
////
//
//import SwiftUI
//
//struct Activity: Identifiable {
//    let id = UUID()
//    let name: String
//    let location: String
//    let date: Date
//    
//    var formattedDate: String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .long
//        return dateFormatter.string(from: date)
//    }
//    
//    var formattedTime: String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.timeStyle = .short
//        return dateFormatter.string(from: date)
//    }
//}
//
//
//struct AddActivity: View {
//    
//    @Binding var activities: [Activity]
//    
//  //  @State private var date: Date = Date()
//
//    @State private var name: String = ""
//    @State private var location: String = ""
//    
//    @State private var allDay: Bool = false
//    @State private var setReminder: Bool = false
//
//    @State private var isStartDatePickerVisible: Bool = false
//    @State private var isEndDatePickerVisible: Bool = false
//    
//    @State private var isPresentingSheetLocation: Bool = false
//    @Binding var isPresentingSheet: Bool
//    
//    @State private var showAlert = false
//    @State private var navigateToSecondScreen = false
//    @Environment(\.presentationMode) var presentationMode
//    
//    
//    @State var startcurrentTime: Date = Date()
//    @State var endcurrentTime: Date = Date()
//    
//    @State private var selectedOptions: [String] = []
//    
// //   @StateObject private var dataStore = DataStore()
//    @State private var showResult: Bool = false
//    @State private var newActivityName = ""
//    @State private var newTimeDesc = ""
//    @State private var newTimeToGo = ""
//    @State private var newActivityLocation = ""
//    @State private var newActivityTime = ""
//

//    //calendar
//    var closedRange = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
//    
//    func formatDate(date : Date) -> String {
//        let components = Calendar.current.dateComponents([.hour, .minute, .day, .month, .year], from: date) //?????
//        
//        let hour = components.hour ?? 0
//        let minute = components.minute ?? 0
//        let day = components.day ?? 0
//        let month = components.month ?? 0
//        let year = components.year ?? 0
//        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MMMM"
//        
//        let monthString = dateFormatter.string(from: date)
//        
//        return "\(day) \(monthString) \(year) (\(hour):\(minute))"
//    }
//    
//    @State private var selectionWeek: Set<String> = []
//    let everyWeek = ["Every Sunday", "Every Monday", "Every Tuesday", "Every Wednesday", "Every Thrusday", "Every Friday", "Every Saturday"]
//    
//    var body: some View {
//        NavigationStack {
//            List {
//                Section {
//                    TextField("Activity", text: $name)
//                    Button(action: {
//                        
//                        isPresentingSheetLocation.toggle()
//                        
//                    }) {
//                        TextField("Location", text: $location)
//                    }
//                }
//                Section {
//                    Toggle(isOn: $allDay) {
//                        Text("All Day")
//                    }
//                }
//                Section {
//                    HStack {
//                        Text("Start Date:")
//                        Spacer()
//                        Button(action: {
//                            isStartDatePickerVisible = true
//                        }) {
//                            HStack {
//                                Text(formatDate(date: startcurrentTime))
//                                Image(systemName: "calendar")
//                                    .foregroundColor(Color("indigoMain"))
//                            }
//                        }
//                        .onTapGesture {
//                            isStartDatePickerVisible.toggle()
//                        }
//                    }
//                    if isStartDatePickerVisible {
//                        ZStack {
//                            Color.white.opacity(0.4)
//                                .edgesIgnoringSafeArea(.all)
//                                .onTapGesture {
//                                    isStartDatePickerVisible.toggle()
//                                }
//                            
//                            VStack {
//                                Spacer()
//                                DatePicker("Pick a date:", selection: $startcurrentTime)
//                                    .datePickerStyle(.graphical)
//                            }
//                        }
//                    }
//                    HStack {
//                        Text("End Date:")
//                        Spacer()
//                        Button(action: {
//                            isEndDatePickerVisible.toggle()
//                        }) {
//                            HStack {
//                                Text(formatDate(date: endcurrentTime))
//                                Image(systemName: "calendar")
//                                    .foregroundColor(Color("indigoMain"))
//                            }
//                        }
//                        .onTapGesture {
//                            isEndDatePickerVisible.toggle()
//                        }
//                    }
//                    if isEndDatePickerVisible {
//                        ZStack {
//                            Color.white.opacity(0.4)
//                                .edgesIgnoringSafeArea(.all)
//                                .onTapGesture {
//                                    isEndDatePickerVisible = false
//                                }
//                            
//                            VStack {
//                                Spacer()
//                                
//                                DatePicker("End Date:", selection: $endcurrentTime, in: Date()...)
//                                    .datePickerStyle(.graphical)
//                            }
//                            
//                        }
//                    }
//                }
//                Section {
//                    HStack {
//                        Picker("Every", selection: $selectionWeek) {
//                            ForEach(everyWeek, id: \.self) {
//                                Text($0)
//                            }
//                        }
//                    }
//                    .pickerStyle(.menu)
//                }
//                Toggle(isOn: $setReminder) {
//                    Text("Set Reminder")
//                }
//            }
//            .listStyle(.insetGrouped)
//            .navigationTitle("Activity")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button(action: {
//               //         isPresentingSheet.toggle()
//                        showAlert.toggle()
//                    }) {
//                        Image(systemName: "chevron.backward")
//                    }
//                    .alert("Delete Changes?",
//                           isPresented: $showAlert,
//                           actions: {
//
//                        Button("No", role: .cancel) {
//                            //
//                        }
//
//                        Button ("Yes", role: .destructive) {
//                            self.presentationMode.wrappedValue.dismiss()
//                        }
//
//                    }, message: {
//                        Text("Your changes won’t be saved. You want to delete them anyway?")
//                    })
//                    
//                }
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button(action: {
//                        let activity = Activity(name: name, location: location, date: Date)
//                        activities.append(activity)
//                        
//                        presentationMode.wrappedValue.dismiss()                    }) {
//                        Image(systemName: "checkmark")
//                    }
//                }
//            }
//        }
//        .sheet(isPresented: $isPresentingSheetLocation) {
//            LocationView(isPresentingSheetLocation: $isPresentingSheetLocation)
//        }
//    }
//    
//    func toggleSelection(for Week: String) {
//        if selectionWeek.contains(Week) {
//            selectionWeek.remove(Week)
//        } else {
//            selectionWeek.insert(Week)
//        }
//    }
//}
//    struct AddActivity_Previews: PreviewProvider {
//        static var previews: some View {
//            AddActivity(activities: .constant([]), isPresentingSheet: .constant(true))
//        }
//    }
