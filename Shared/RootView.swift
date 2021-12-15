//
//  ContentView.swift
//  Shared
//
//  Created by Zayne on 16/05/2021.
//

import Foundation
import SwiftUI

struct RootView: View {
	var body: some View {
		VStack(alignment: .center, content: {

			Text("\(Image(systemName: "books.vertical.fill")) Librarian").font(.largeTitle)

			TabView {
				// TODO: Badges to show updates in folders and stuff, (needs to re index)
				FolderView().badge(10)
				            .tabItem {
					            Image(systemName: "folder")
					            Text("Folders")
				            }
				SearchView()
						.tabItem {
							Image(systemName: "magnifyingglass")
							Text("Search")
						}
			}
		}).padding()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		//		RootView().preferredColorScheme(.dark)
		RootView().previewDevice("iPhone 12 Pro Max").preferredColorScheme(.dark)
	}
}

extension View {
	/// Applies the given transform if the given condition evaluates to `true`.
	/// - Parameters:
	///   - condition: The condition to evaluate.
	///   - transform: The transform to apply to the source `View`.
	/// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
	@ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
		if condition {
			transform(self)
		}
		else {
			self
		}
	}
}
