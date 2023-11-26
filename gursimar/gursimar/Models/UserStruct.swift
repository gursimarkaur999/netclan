//
//  UserStruct.swift
//  gursimar
//
//  Created by Gursimar on 26/11/23.
//

import Foundation
struct UserStruct {
    var imageName: String
    var userName: String
    var location: String
    var hobbies: [String]
    var profileDescription: String
    var invitationStatus: InvitationStatus

    init(imageName: String, userName: String, location: String, hobbies: [String], profileDescription: String, invitationStatus: InvitationStatus) {
        self.imageName = imageName
        self.userName = userName
        self.location = location
        self.hobbies = hobbies
        self.profileDescription = profileDescription
        self.invitationStatus = invitationStatus
    }
}
enum InvitationStatus {
    case Invite
    case Pending
    case Accepted
}
