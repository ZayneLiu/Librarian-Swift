//
//  ContentView.swift
//  Shared
//
//  Created by Zayne on 16/05/2021.
//

import Foundation
import SwiftUI

var TOP_BAR_HEIGHT: CGFloat = 30.0
class EnvironmentObj: ObservableObject {
	@Published var isActive = true
}

struct RootView: View {
	@ObservedObject var envObj = EnvironmentObj()

	var body: some View {
		NavigationView {
			VStack(alignment: .center, spacing: 10, content: {
//				#if os(macOS)
				HStack {
					Text("\(Image(systemName: "books.vertical.fill")) Librarian")
						.font(.title)
				}.frame(height: TOP_BAR_HEIGHT, alignment: .center)
//				#endif

				Divider()

				NavigationLink(destination: FolderView().navigationTitle("Folders")) {
					Text("\(Image(systemName: "folder.badge.plus"))Folders").font(.title2)
				}.buttonStyle(.plain)

				NavigationLink(destination: SearchView().navigationTitle("Search")) {
					Text("\(Image(systemName: "magnifyingglass"))Search").font(.title2)
				}.buttonStyle(.plain)
				Spacer()
			})
				.padding()
			#if os(iOS)
				.navigationBarTitle("Menu")
			#endif

			SearchView().navigationTitle("Search")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		RootView()
	}
}
