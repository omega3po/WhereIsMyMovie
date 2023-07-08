//
//  ViewModel.swift
//  WhereIsMyMovie
//
//  Created by Sunny Hwang on 2023/07/01.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    static let key = "ab8ca7862f2733af2356c592de5f9d45"
    @Published var trending: [Movie] = []
    func loadTrending() {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=\(ViewModel.key)")!
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let trendingResult = try JSONDecoder().decode(TrendingResults.self, from: data)

                trending = trendingResult.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
