//
//  AppConstants.swift
//  News
//
//  Created by Meenakshi Pathani on 07/10/25.
//

import Foundation

enum AppTheme: String, CaseIterable, Identifiable {
    case system = "System"
    case light = "Light"
    case dark = "Dark"
    
    var id: String { self.rawValue }
}

enum AppConstants {

    static let defaultCountryCode = "us"
    static let language = "en"
    
    // MARK: - API
    enum API {
        static let apiKey = "310d7714059945c99c7d6f4fe3fcec4e"//"YOUR_API_KEY"
        static let baseURL = "https://newsapi.org/v2/top-headlines"
    }
    
    // MARK: - API PARAMS 

    enum API_PARARMS {
        static let apiKey = "apiKey"
        static let country = "country"
    }

    // MARK: - UserDefaults Keys
    enum StorageKey {
        static let selectedCountryCode = "selectedCountryCode"
        static let selectedTheme = "selectedTheme"
    }

    // MARK: - UI
    enum UI {
        static let defaultCornerRadius: CGFloat = 8.0
        static let defaultPadding: CGFloat = 16.0
        static let placeholderImageName = "photo"
    }

//    // MARK: - Strings
//    enum Strings {
//        static let appTitle = "News App"
//        static let noArticlesFound = "No articles found"
//        static let loading = "Loading..."
//    }
}


