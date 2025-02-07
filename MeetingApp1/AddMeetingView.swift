//
//  AddMeetingView.swift
//  MeetingApp1
//
//  Created by mac os on 30/1/25.
//

import SwiftUI

struct AddMeetingView: View {
    @ObservedObject var viewModel: MeetingViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var date = Date()
    @State private var location = ""
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Title")) {
                    TextField("Enter title", text: $title)
                }
                Section(header: Text("Date")) {
                    DatePicker("Select Date", selection: $date, displayedComponents: .date)
                }
                Section(header: Text("Location")) {
                    TextField("Enter location", text: $location)
                }
            }
            .navigationTitle("New Meeting")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        viewModel.addMeeting(title: title, date: date, location: location)
                        presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(title.isEmpty || location.isEmpty)
                }
            }
        }
    }
}
