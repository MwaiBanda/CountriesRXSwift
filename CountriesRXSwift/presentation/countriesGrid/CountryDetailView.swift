//
//  CountryDetailView.swift
//  CountriesRXSwift
//
//  Created by Mwai Banda on 6/6/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct CountryDetailView: View {
    var country: Country
    var body: some View {
        ZStack {
            Color(.systemGray5).ignoresSafeArea(.all)

        ScrollView {
            VStack(alignment: .center) {
                HStack {
                    Text(country.name)
                        .font(.title)
                        .fontWeight(.black)
                        .padding(.leading)
                    Spacer()
                }.padding(.leading)
                
                WebImage(url: URL(string: country.flagURL ?? ""), context: [.imageThumbnailPixelSize : CGSize.zero])
                    .resizable()
                    .placeholder(Image(systemName: "photo"))
                    .indicator(Indicator.progress)
                    .transition(.fade(duration: 0.5))
                    .foregroundColor(.gray.opacity(0.5))
                    .frame(width: screenBounds.width - 90, height: 211)
                
                VStack {
                    ForEach(country.cities ?? ["No Cities Available"], id: \.self) { city in
                        HStack {
                            Text(city)
                            Spacer()
                        }.padding(.vertical, 7)
                            .padding(.horizontal)
                        Divider()
                            .padding(.horizontal)
                    }
                } .padding(.horizontal)
                Spacer()
            }
        }.offset(y: -35)
        }
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: Country(name: "Zambia", unicodeFlag: "🇿🇲", cities: ["Ndola", "Lusaka"]))
    }
}
