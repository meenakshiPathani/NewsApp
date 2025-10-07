//
//  NewsViewModel.swift
//  News
//
//  Created by Meenakshi Pathani on 06/10/25.
//

import Foundation
import Observation

@Observable
final class NewsViewModel {
 var articles: [Article] = []
 var isLoading: Bool = false
    let service = NetworkService()

    private var countryCode: String {
        UserDefaults.standard.string(forKey: AppConstants.StorageKey.selectedCountryCode) ?? AppConstants.defaultCountryCode
    }
    
    
    func fetchNews() async {
        
        isLoading = true
        defer { isLoading = false }
        
        do {
            let result: NewsResponse = try await service.getRequest(
                queryParams: [AppConstants.API_PARARMS.country: countryCode],
                responseType: NewsResponse.self
            )
            print(result)
            self.articles = result.articles
        } catch {
            print("Error fetching news:", error)
        }
    }
}
