//
//  MeetingListView.swift
//  MeetingApp1
//
//  Created by mac os on 30/1/25.
//

import SwiftUI

struct MeetingListView: View {
    @StateObject var viewModel = MeetingViewModel();
    @State private var showAddMeeting = false;
    @State private var isEditing = false;
    @State private var selectedMeeting: Meeting?
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.meetings) { meeting in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(meeting.title).font(.headline)
                            Text(meeting.location).font(.subheadline)
                            Text(meeting.date, style: .date).font(.caption)
                        }
                        Spacer()
                        
                        Button(action: {
                            selectedMeeting = meeting
                            
                        }) {
                            Image(systemName: "pencil.circle").foregroundColor(.blue)
                        }
                        Button(action: {
                            viewModel.deleteMeeting(meeting: meeting)
                        }) {
                            Image(systemName: "trash.circle").foregroundColor(.red)
                        }
                    }
                }
                .id(UUID())
            }
            .navigationTitle("Meetings")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddMeeting = true
                    }) {
                        Label("Add", systemImage: "plus.circle.fill")
                    }
                }
            }
            .sheet(isPresented: $showAddMeeting) {
                AddMeetingView(viewModel: viewModel)
            }
            .sheet(item: $selectedMeeting) {
                meeting in
                EditMeetingView(viewModel: viewModel, meeting: meeting)
            }
        }
    }
}

#Preview {
    MeetingListView()
}
