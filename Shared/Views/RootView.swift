//
//  ContentView.swift
//  Shared
//
//  Created by Zayne on 16/05/2021.
//

import SwiftUI

var TOP_BAR_HEIGHT: CGFloat = 36.0

struct RootView: View {
	var body: some View {
		VStack(content: {
			NavigationView(content: {
				FolderView()
				SearchView()
			}).frame(idealWidth: 600,
			         minHeight: 500,
			         alignment: .center)

		}).frame(alignment: .top)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		RootView()
	}
}
