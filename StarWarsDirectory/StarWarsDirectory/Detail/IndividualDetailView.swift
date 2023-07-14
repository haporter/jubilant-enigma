//
//  IndividualDetailView.swift
//  StarWarsDirectory
//
//  Created by Andrew Porter on 7/12/23.
//

import SwiftUI
import Kingfisher

struct IndividualDetailView: View {
    
    let individual: Individual
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .long
        
        return formatter
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                ZStack(alignment: .leading) {
                    LinearGradient(colors: [individual.affiliation == .sith ? .darkModeGray : .black, individual.affiliation.color], startPoint: .top, endPoint: .bottom)
                        .frame(maxHeight: 275)
                    KFImage(individual.profilePicture)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .background(
                            Circle()
                                .stroke(Color.white, lineWidth: 10)
                        )
                        .padding(EdgeInsets(top: 275, leading: 24, bottom: 0, trailing: 0))
                }
                .frame(height: 275)
                .ignoresSafeArea(.all, edges: .top)
                
                HStack {
                    Text(individual.firstName + " " + individual.lastName!)
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    Image(individual.affiliation.icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 48, height: 48)
                }
                .padding(EdgeInsets(top: 100, leading: 24, bottom: 0, trailing: 24))
                         
                VStack(alignment: .leading, spacing: 16) {
                    Text("Birth Date: ")
                        .fontWeight(.bold) +
                    Text(individual.birthdate, formatter: dateFormatter)
                    
                    Text("Force: ")
                        .fontWeight(.bold) +
                    Text(individual.forceSensitive ? "YES" : "NO")
                    
                    Text("Affiliation: ")
                        .fontWeight(.bold) +
                    Text(individual.affiliation.name)
                }
                .font(.callout)
                .padding(24)
                
                Spacer()
            }
            .foregroundStyle(.white)
            .background(Color.darkModeGray)
        }
        .ignoresSafeArea(.all, edges: .all)
        .navigationBarTitleDisplayMode(.inline)
    }
}
