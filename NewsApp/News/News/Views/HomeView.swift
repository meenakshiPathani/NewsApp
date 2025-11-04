//
//  HomeView.swift
//  News
//
//  Created by Meenakshi Pathani on 06/10/25.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.articles.isEmpty && !viewModel.isLoading {
                    VStack(spacing: 12) {
                        Image(systemName: "newspaper")
                            .font(.system(size: 40))
                            .foregroundColor(.gray)
                        Text("No articles found")
                            .foregroundColor(.secondary)
                            .font(.headline)
                    }
                    .padding()
                } else {
                    List(viewModel.articles.isEmpty ? Array(repeating: placeholderArticle, count: 5) : viewModel.articles) { article in
                        NavigationLink(destination: ArticleDetailView(article: article)) {
                            ArticleRowView(article: article)
                                .onAppear {
                                    Task {
                                        await viewModel.loadMoreIfNeeded(currentItem: article)
                                    }
                                }
                        }
                        .refreshable {
                            viewModel.canLoadMore = true
                            await viewModel.fetchNews(page: 1)
                        }
                        .disabled(viewModel.isLoading) // Prevent tap while loading
                    }
                    .listStyle(.plain)
                    .redacted(reason: viewModel.isLoading ? .placeholder : [])
                }
            }
            .navigationTitle("\(viewModel.selectedNewsCategory.pageTitle)")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                            .imageScale(.large)
                            .accessibilityLabel("Settings")
                    }
                }
            }
            .task {
                await viewModel.fetchNews()
            }
            .overlay(
                Group {
                    if viewModel.isLoading && viewModel.articles.isEmpty {
                        ProgressView("Loading news...")
                    }
                }
            )
        }
    }
    
    /// Dummy article used for redacted placeholder
    private var placeholderArticle: Article {
        Article(source: Source(id: "", name: ""), author: nil, title: "", description: nil, url: "", urlToImage: nil, publishedAt: "", content: nil)
    }
}



#Preview {
    HomeView()
}
