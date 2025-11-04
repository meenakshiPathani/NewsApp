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
    
    var currentPage = 1
    var canLoadMore = true
    let pageSize = 10
    
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
    
    
    func fetchNews(page: Int = 1) async {
        guard !isLoading else { return }
        isLoading = true
        defer { isLoading = false }
        
        do {
            var queryParams: [String: String] = [
                AppConstants.API_PARARMS.country: countryCode,
                AppConstants.API_PARARMS.page: String(page),
                AppConstants.API_PARARMS.pageSize: String(pageSize)
            ]
            
            if selectedNewsCategory != .all {
                queryParams[AppConstants.API_PARARMS.category] = selectedNewsCategory.rawValue
            }
            
            let result: NewsResponse = try await service.getRequest(
                queryParams: queryParams,
                responseType: NewsResponse.self
            )
            
            if page == 1 {
                articles = result.articles
            } else {
                articles += result.articles
            }
            
            // Optional: Stop if no more articles
            if result.articles.count == result.totalResults {
                canLoadMore = false
            }
            
            currentPage = page
        } catch {
            print("Error fetching news:", error)
        }
    }
    
    func loadMoreIfNeeded(currentItem item: Article) async {
        guard let lastItem = articles.last else { return }
        
        if item.id == lastItem.id && canLoadMore && !isLoading {
            await fetchNews(page: currentPage + 1)
        }
    }
}
