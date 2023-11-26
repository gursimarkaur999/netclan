//
//  RefineRow.swift
//  gursimar
//
//  Created by Gursimar on 20/11/23.
//

import SwiftUI

struct RefineRow: View {
    var item: JoinAsMenuItem
    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 30)
                .foregroundStyle(Color.white)
                .padding(20)
                .background(Color.blue)
                .clipShape(Circle())
                .padding(.leading, -30)
                .padding(.top, -30)
                .padding(.bottom, -30)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(item.optionName)
                    .font(.headline)
                Text(item.optionDescription)
                    .font(.caption)
            }
            .padding(7)
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
        .padding(.leading, 10).fixedSize(horizontal: true, vertical: false)
    }
}

#Preview {
    RefineRow(item: JoinAsMenuItem(imageName: "person.3", optionName: "Individual", optionDescription: "Join and build real time community."))
}
