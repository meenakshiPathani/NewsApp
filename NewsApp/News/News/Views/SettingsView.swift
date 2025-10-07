//
//  SettingsView.swift
//  News
//
//  Created by Meenakshi Pathani on 06/10/25.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage(AppConstants.StorageKey.selectedCountryCode) private var selectedCountryCode: String = AppConstants.defaultCountryCode
    @AppStorage(AppConstants.StorageKey.selectedTheme) private var selectedThemeRaw: String = AppTheme.system.rawValue
    
    var selectedTheme: AppTheme {
        get { AppTheme(rawValue: selectedThemeRaw) ?? .system }
        set { selectedThemeRaw = newValue.rawValue }
    }
    
    var body: some View {
        Form {
            Section(header: Text("Select Country")) {
                Picker("Country", selection: $selectedCountryCode) {
                    ForEach(Country.countries) { country in
                        Text(country.name).tag(country.code)
                    }
                }
            }
            
            Section(header: Text("Select Theme")) {
                Picker("Theme", selection: $selectedThemeRaw) {
                    ForEach(AppTheme.allCases) { theme in
                        Text(theme.rawValue).tag(theme.rawValue)
                    }
                }
            }
        }
        .navigationTitle("Settings")
    }
}


#Preview {
    SettingsView()
}
