//
//  IndividualCellView.swift
//  StarWarsDirectory
//
//  Created by Andrew Porter on 7/12/23.
//

import SwiftUI
import Kingfisher

struct IndividualCellView: View {
    
    let individual: Individual
    
    var body: some View {
        HStack {
            KFImage(individual.profilePicture)
                .placeholder {
                    Image(.Icons.ewok)
                        .resizable()
                        .foregroundColor(.darkModeGray)
                        .frame(width: 48, height: 48)
                        .padding()
                        .background(Color.gray)
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 64, height: 64)
                .clipShape(Circle())
            
            Text(individual.fullName)
                .font(.title3)
            Spacer()
            
            Image(individual.affiliation.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
        }
        .padding()
    }
}
