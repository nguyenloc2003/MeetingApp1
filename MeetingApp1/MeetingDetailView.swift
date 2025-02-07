//
//  MeetingDetailView.swift
//  MeetingApp1
//
//  Created by mac os on 30/1/25.
//

import SwiftUI

struct MeetingDetailView: View {
    let meeting: Meeting
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(meeting.title).font(.largeTitle).bold()
            Text("Location: \(meeting.location)").font(.title3)
            Text("Date: \(meeting.date.formatted(date: .long, time: .omitted))")
                .font(.title3)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Meeting Details")
    }
}
