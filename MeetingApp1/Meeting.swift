//
//  Meeting.swift
//  MeetingApp1
//
//  Created by mac os on 30/1/25.
//

import Foundation

struct Meeting: Identifiable {
    var id: UUID = UUID();
    var title: String;
    var date: Date;
    var location: String;
}
