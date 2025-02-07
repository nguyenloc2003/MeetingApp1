//
//  MeetingViewModel.swift
//  MeetingApp1
//
//  Created by mac os on 30/1/25.
//

import Foundation

class MeetingViewModel: ObservableObject {
    @Published var meetings: [Meeting] = [] {
        didSet {
            objectWillChange.send()
        }
    }
    
    func addMeeting(title: String, date: Date, location: String) {
        let newMeeting = Meeting(title: title, date: date, location: location)
        meetings.append(newMeeting);
    }
    
    func editMeeting(meeting: Meeting, newTitle: String, newDate: Date, newLocation: String) {
        if let index = meetings.firstIndex(where: { $0.id == meeting.id }) {
            meetings[index].title = newTitle
            meetings[index].date = newDate
            meetings[index].location = newLocation
        }
    }
    
    func deleteMeeting(meeting: Meeting) {
        meetings.removeAll{ $0.id == meeting.id }
    }
}
