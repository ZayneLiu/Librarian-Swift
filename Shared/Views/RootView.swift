//
//  ContentView.swift
//  Shared
//
//  Created by Zayne on 16/05/2021.
//

import SwiftUI

var TOP_BAR_HEIGHT:CGFloat=36.0

class EnvObj: ObservableObject {
	@Published var text_input = ""
	@Published var resultList: [SearchResult] = [
		SearchResult(result: "a"),
		SearchResult(result: "b"),
		SearchResult(result: "c"),
	]
}

struct RootView: View {
	var body: some View {
		HSplitView {
			SideView()
			MainView()
		}.frame(idealWidth: 600,
		        minHeight: 500,
		        idealHeight: 500,
		        alignment: .top)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		RootView()
	}
}
