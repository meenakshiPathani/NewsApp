//
//  NetworkService.swift
//  News
//

import Foundation

// MARK: - Top-level response
struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    var id: String { url } // Use `url` as unique identifier

    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}

extension Article {
    var formattedDate: String {
        ISO8601DateFormatter().date(from: publishedAt)?
            .formatted(date: .abbreviated, time: .shortened) ?? ""
    }
    
    var emptyArticle: Article {
        Article(source: Source(id: "", name: ""), author: nil, title: "", description: nil, url: "", urlToImage: nil, publishedAt: "", content: nil)
    }
}
