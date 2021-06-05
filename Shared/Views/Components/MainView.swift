//
//  Main.swift
//  Librarian
//
//  Created by Zayne on 02/06/2021.
//

import SwiftUI

struct MainView: View {
	@State var envObj = EnvObj()
	var body: some View {
		VStack(spacing: 10, content: {
			VStack(content: {
				HStack(content: {
					Text("Search Keyword:")
					TextField("Input", text: $envObj.text_input)
						.frame(width: 150, alignment: .center)

					Button("Search") {
						print(envObj.text_input)
						#warning("TODO: Call search API")
					}
				})
			}).frame(maxHeight: TOP_BAR_HEIGHT)
			Divider()
			Text("Search Result:")
			List {
				// List of search result
				ForEach(envObj.resultList) { item in
					Text("\(item.result)")
				}
			}
		}).padding(.vertical, 15)
			.frame(alignment: .top)
	}
}

struct Main_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			MainView()
			RootView()
		}
	}
}
