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
				.toolbar {
					// Create a sidebar toggle button
					ToolbarItem(placement: .navigation) {
						Button(action: toggleSidebar, label: {
							Image(systemName: "sidebar.left")
						})
					}
				}
		}
//		.commands {
//			CommandGroup(after: .sidebar) {
//				Button(action: {}) {
//					#warning("TODO: show side bar")
//					#warning("TODO: extract all states")
//					Text("MyApp Help")
//				}
//			}
//			CommandMenu("Edit") {}
//		}
	}

	/// Sidebar toggle function
	private func toggleSidebar() {
		#if os(iOS)
		#else
			NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
		#endif
	}
}
