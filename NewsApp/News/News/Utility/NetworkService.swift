//
//  NetworkService.swift
//  News
//
//  Created by Meenakshi Pathani on 06/10/25.
//

import Foundation

final class NetworkService {
    
    // MARK: - Generic GET Request
    func getRequest<T: Decodable>(queryParams: [String: String], responseType: T.Type) async throws -> T {
        guard var urlComponents = URLComponents(string: AppConstants.API.baseURL) else {
            throw URLError(.badURL)
        }

        // Add query items
        var items = [URLQueryItem(name: AppConstants.API_PARARMS.apiKey, value: AppConstants.API.apiKey)]
        queryParams.forEach { key, value in
            items.append(URLQueryItem(name: key, value: value))
        }
        urlComponents.queryItems = items

        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            print("❌ GET request failed: \(error.localizedDescription)")
            throw error
        }
    }

    // MARK: - Generic POST Request
    func postRequest<T: Decodable, U: Encodable>(endpoint: String, body: U, responseType: T.Type) async throws -> T {
        guard let url = URL(string: AppConstants.API.baseURL + endpoint + "?apikey=" + AppConstants.API.apiKey) else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(body)
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            print("❌ POST request failed: \(error.localizedDescription)")
            throw error
        }
    }
}
