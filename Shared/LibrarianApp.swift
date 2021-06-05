//
//  LibrarianApp.swift
//  Shared
//
//  Created by Zayne on 16/05/2021.
//

import SwiftUI

@main
struct LibrarianApp: App {
	var body: some Scene {
		WindowGroup {
			RootView()
		}.commands {
			CommandGroup(after: .sidebar) {
				Button(action: {}) {
					#warning("TODO: show side bar")
					#warning("TODO: extract all states")
					Text("MyApp Help")
				}
			}
			CommandMenu("Edit") {}
		}
	}
}
