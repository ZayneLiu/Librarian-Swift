//
//  Main.swift
//  Librarian
//
//  Created by Zayne on 02/06/2021.
//

import SwiftUI

struct SearchView: View {
	@ObservedObject var model = SearchViewModel.model

	var body: some View {
		VStack(spacing: 10, content: {
			VStack(content: {
				HStack(content: {
					Text("Search Keyword:")
					TextField("Input", text: $model.text_input)
						.frame(width: 150, alignment: .center)

					Button("Search") {
						print(model.text_input)
						#warning("TODO: Call search API")
					}
				})
			}).frame(maxHeight: TOP_BAR_HEIGHT)
			Divider()

			HStack {
				Text("Search Result:")
				Text("Found \(model.resultList.count) file(s)")
					.font(.subheadline)
					.italic()
			}

			List(content: {
				// List of search result
				ForEach(model.resultList) { result in
					// Search Result File item
					#warning("Search Result File item")
					SearchResultItem(result: SearchResult(searchResult: result))
				}
			})
		}).frame(alignment: .top)
	}
}

struct Main_Previews: PreviewProvider {
	static var previews: some View {
		SearchView()
	}
}
