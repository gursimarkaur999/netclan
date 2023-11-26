//
//  UserRow.swift
//  gursimar
//
//  Created by Gursimar on 26/11/23.
//

import SwiftUI

struct UserRow: View {
    var item: UserStruct
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Spacer() // Push the button to the right
                switch(item.invitationStatus) {
                    case InvitationStatus.Invite :
                        Button("INVITE", systemImage: "plus") {
                            print("Invite Button clicked!")
                        }.font(.system(size: 15))
                            .alignmentGuide(.top) { d in d[.bottom] }
                            .padding(10).padding(.trailing, 10)
                    case InvitationStatus.Accepted :
                        Button("ACCEPTED") {
                            print("Invite Accepted!")
                        }.font(.system(size: 15))
                            .alignmentGuide(.top) { d in d[.bottom] }
                            .padding(10).padding(.trailing, 10)
                    case InvitationStatus.Pending:
                        Button("PENDING") {
                            print("Invite Pending!")
                        }.font(.system(size: 15)).foregroundStyle(Color.gray)
                            .alignmentGuide(.top) { d in d[.bottom] }
                            .padding(10).padding(.trailing, 10)
                }
                
            }
            
            HStack(spacing: 0) { // Set spacing to 0
                Image(systemName: item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundStyle(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10.0)
                    
                VStack(alignment: .leading, spacing: 8) {
                    Text(item.userName)
                        .font(.headline)
                    Text(item.location)
                        .font(.caption)
                    Rectangle()
                        .frame(width: 100, height: 12) // Set the width and height of the rectangle
                        .foregroundColor(Color.blue) // Set the default color to grey
                        .overlay(
                            Rectangle()
                                .frame(width: 33, height: 12)// Set the width to 1/3 of the rectangle
                                .foregroundColor(Color.gray) // Set the color to blue
                                .offset(x:33.0)
                        )
                        .cornerRadius(6) // Set half of the height to create rounded corners on the filled side
                }.padding(.leading, 20)
            }.padding(.leading, -130).offset(y: -20)
            HStack(spacing: 0) {
                Text(item.hobbies.joined(separator: " | ")).font(.subheadline).bold().padding(.leading)
                Spacer()
            }
            HStack(spacing: 0) {
                Text(item.profileDescription).font(.subheadline).padding(.leading).padding(.bottom).padding(.top, 5)
                Spacer()
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.white, lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.white)
                        .shadow(radius: 5)
                )
        )
        .padding(.leading, 40).padding(.trailing, 40).padding(.bottom, 10).padding(.top, 10)
    }
}

#Preview {
    UserRow(item: UserStruct(imageName: "avatar", userName: "JohnDoe", location: "City", hobbies: ["Reading", "Hiking"], profileDescription: "A description about John Doe.", invitationStatus: .Pending))
}
