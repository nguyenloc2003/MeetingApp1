//
//  EditMeetingView.swift
//  MeetingApp1
//
//  Created by mac os on 7/2/25.
//

import SwiftUI

struct EditMeetingView: View {
    @ObservedObject var viewModel: MeetingViewModel
    @State var meeting: Meeting
    
    @State private var title: String
    @State private var location: String
    @State private var date: Date
    
    @Environment(\.presentationMode) var presentationMode
    
    init(viewModel: MeetingViewModel, meeting: Meeting) {
        self.viewModel = viewModel
        self.meeting = meeting
        _title = State(initialValue: meeting.title)
        _location = State(initialValue: meeting.location)
        _date = State(initialValue: meeting.date)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Enter title", text: $title)
                }
                Section(header: Text("Location")) {
                    TextField("Enter location", text: $location)
                }
                Section(header: Text("Date")) {
                    DatePicker("Select Date", selection: $date, displayedComponents: .date)
                }
            }
            .navigationTitle("Edit Meeting")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        viewModel.editMeeting(meeting: meeting, newTitle: title, newDate: date, newLocation: location)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}
