//
//  DetailViewModel.swift
//  WhereIsMyMovie
//
//  Created by Sunny Hwang on 2023/07/15.
//

import Foundation

@MainActor
class DetailViewModel: ObservableObject {
    @Published var credit: CreditModel?
    @Published var cast: [CreditModel.Cast] = []
    @Published var castProfile: [CastProfile] = []
    
    func movieCredits(for movieID: Int) async {
        let url: URL = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/credits?api_key=\(ViewModel.key)&language=en-US")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let creditData = try JSONDecoder().decode(CreditModel.self, from: data)
            self.credit = creditData
            self.cast = creditData.cast.sorted(by: { $0.order < $1.order })
        } catch {
            print(error.localizedDescription)
        }
        print(cast)
    }
    
    func loadCastProfile() async {
        do {
            for item in cast {
                let url = URL(string: "https://api.themoviedb.org/3/person/\(item.id)?api_key=\(ViewModel.key)&language=en-US")!
                
                let (data, _) = try await URLSession.shared.data(from: url)
                let castData = try JSONDecoder().decode(CastProfile.self, from: data)
                self.castProfile.append(castData)
            }
        } catch {
            
        }
        print(castProfile.first)
    }
}
