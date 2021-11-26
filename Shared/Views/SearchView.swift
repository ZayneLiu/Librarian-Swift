//
//  Main.swift
//  Librarian
//
//  Created by Zayne on 02/06/2021.
//

import Custodian
import SwiftUI

struct SearchView: View {
	@ObservedObject var model = SearchViewModel.model
	@ObservedObject var folderModel = FolderViewModel.model

	var body: some View {
		VStack(spacing: 10, content: {
			VStack(content: {
				HStack(content: {
					TextField("Keyword", text: $model.text_input)
						.disableAutocorrection(true)
						.textFieldStyle(RoundedBorderTextFieldStyle())
						.frame(width: 200, alignment: .center)
					#if os(iOS)
						.autocapitalization(.none)
					#endif

					Button("Search") {
						let searchRes = folderModel.search(keyword: model.text_input)
						model.resultList = searchRes
					}
				})
			})
					// .frame(maxHeight: TOP_BAR_HEIGHT)

			HStack(content: {
				Text("Search Result:")
				Text("Found \(model.resultList.count) file(s)").font(.subheadline).italic()
			})

			List {
				// List of search result
				ForEach(model.resultList, id: \.id) { result in
					SearchResultItem(result: result)
				}
			}.padding(0)
		}).frame(alignment: .top).padding()
	}
}

struct Main_Previews: PreviewProvider {
	static var previews: some View {
		SearchView()
	}
}
