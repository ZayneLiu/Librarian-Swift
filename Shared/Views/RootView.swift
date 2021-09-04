//
//  ContentView.swift
//  Shared
//
//  Created by Zayne on 16/05/2021.
//

import Foundation
import SwiftUI

var TOP_BAR_HEIGHT: CGFloat = 36.0
class EnvironmentObj: ObservableObject {
	@Published var isActive = true
}

struct RootView: View {
	@ObservedObject var envObj = EnvironmentObj()

	var body: some View {
		NavigationView {
			VStack(content: {
				#if os(macOS)
					Text("\(Image(systemName: "books.vertical.fill")) Librarian")
						.font(.title)
				#endif

				FolderView()

//				NavigationLink(destination: FolderView().navigationTitle("Folders")) {
//					HStack {
//						Image(systemName: "folder.badge.plus")
//							.frame(width: 25, alignment: .center)
//						Text("Folders")
//					}.font(.title2)
//				}
//
//				NavigationLink(destination: SearchView().navigationTitle("Search")) {
//					HStack {
				////						Image(systemName: "doc.text.magnifyingglass")
//						Image(systemName: "magnifyingglass")
//							.frame(width: 25, alignment: .center)
//						Text("Search")
//					}.font(.title2)
//				}

			})
			#if os(iOS)
				.navigationBarTitle("Librarian")
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
