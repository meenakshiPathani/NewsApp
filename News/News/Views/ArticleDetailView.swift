//
//  ArticleView.swift
//  News
//
//  Created by Meenakshi Pathani on 06/10/25.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: Article

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let imageUrl = article.urlToImage,
                   let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 200)
                    }
                }

                Text(article.title)
                    .font(.title)
                    .bold()

                if let description = article.description {
                    Text(description)
                        .font(.body)
                }

                if let content = article.content {
                    Text(content)
                        .font(.body)
                }

                Link("Read Full Article", destination: URL(string: article.url)!)
                    .font(.headline)
                    .foregroundColor(.blue)
            }
            .padding()
        }
        .navigationTitle(article.source.name)
        .toolbar{
            ShareLink(item: article.url) {
                Label("Share", systemImage: "square.and.arrow.up")
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}


//#Preview {
//    ArticleDetailView()
//}
