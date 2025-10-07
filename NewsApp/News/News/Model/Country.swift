//
//  NetworkService.swift
//  News
//

import Foundation

struct Country: Identifiable {
    let id = UUID()
    let code: String
    let name: String
}

extension Country {
    static let countries: [Country] = [
        Country(code: "ar", name: "Argentina"),
        Country(code: "am", name: "Armenia"),
        Country(code: "au", name: "Australia"),
        Country(code: "at", name: "Austria"),
        Country(code: "by", name: "Belarus"),
        Country(code: "be", name: "Belgium"),
        Country(code: "bo", name: "Bolivia"),
        Country(code: "br", name: "Brazil"),
        Country(code: "bg", name: "Bulgaria"),
        Country(code: "ca", name: "Canada"),
        Country(code: "cl", name: "Chile"),
        Country(code: "cn", name: "China"),
        Country(code: "co", name: "Colombia"),
        Country(code: "hr", name: "Croatia"),
        Country(code: "cz", name: "Czechia"),
        Country(code: "ec", name: "Ecuador"),
        Country(code: "eg", name: "Egypt"),
        Country(code: "fr", name: "France"),
        Country(code: "de", name: "Germany"),
        Country(code: "gr", name: "Greece"),
        Country(code: "hn", name: "Honduras"),
        Country(code: "hk", name: "Hong Kong"),
        Country(code: "in", name: "India"),
        Country(code: "id", name: "Indonesia"),
        Country(code: "ir", name: "Iran"),
        Country(code: "ie", name: "Ireland"),
        Country(code: "il", name: "Israel"),
        Country(code: "it", name: "Italy"),
        Country(code: "jp", name: "Japan"),
        Country(code: "kr", name: "Korea"),
        Country(code: "mx", name: "Mexico"),
        Country(code: "nl", name: "Netherlands"),
        Country(code: "nz", name: "New Zealand"),
        Country(code: "ni", name: "Nicaragua"),
        Country(code: "pk", name: "Pakistan"),
        Country(code: "pa", name: "Panama"),
        Country(code: "pe", name: "Peru"),
        Country(code: "pl", name: "Poland"),
        Country(code: "pt", name: "Portugal"),
        Country(code: "qa", name: "Qatar"),
        Country(code: "ro", name: "Romania"),
        Country(code: "ru", name: "Russia"),
        Country(code: "sa", name: "Saudi Arabia"),
        Country(code: "za", name: "South Africa"),
        Country(code: "es", name: "Spain"),
        Country(code: "ch", name: "Switzerland"),
        Country(code: "sy", name: "Syria"),
        Country(code: "tw", name: "Taiwan"),
        Country(code: "th", name: "Thailand"),
        Country(code: "tr", name: "Turkey"),
        Country(code: "ua", name: "Ukraine"),
        Country(code: "gb", name: "United Kingdom"),
        Country(code: "us", name: "United States Of America"),
        Country(code: "uy", name: "Uruguay"),
        Country(code: "ve", name: "Venezuela")
    ]

}
