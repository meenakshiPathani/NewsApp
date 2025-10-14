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
       
    var selectedNewsCategory: NewsCategory {
        if let rawValue = UserDefaults.standard.string(forKey: AppConstants.StorageKey.selectedCategory),
           let category = NewsCategory(rawValue: rawValue) {
            return category
        } else {
            return .all // or `.all` if you added that
        }
    }

    
    func fetchNews() async {
        
        isLoading = true
        defer { isLoading = false }
        
        do {
            var queryParams: [String: String] = [AppConstants.API_PARARMS.country: countryCode]

            if selectedNewsCategory != .all {
                queryParams[AppConstants.API_PARARMS.category] = selectedNewsCategory.rawValue
            }

            let result: NewsResponse = try await service.getRequest(
                queryParams: queryParams,
                responseType: NewsResponse.self
            )
            print(result)
            self.articles = result.articles
        } catch {
            print("Error fetching news:", error)
        }
    }
}
