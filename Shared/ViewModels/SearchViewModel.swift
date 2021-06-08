//
//  ViewModel.swift
//  Librarian
//
//  Created by Zayne on 02/06/2021.
//

import Foundation

// class SearchResultViewModel: ObservableObject {
//	@Published var searchResult = []
// }

class SearchViewModel: ObservableObject {
	/// Singleton
	public static let model = SearchViewModel()

	private init() {}

	@Published var text_input = ""
	@Published var resultList: [SearchResult] = [
		SearchResult(file: File(url: URL(fileURLWithPath: "~/Workspace/TODO.org")), occurances: 12),
		SearchResult(file: File(url: URL(fileURLWithPath: "~/Workspace/TODO.org")), occurances: 12),
		SearchResult(file: File(url: URL(fileURLWithPath: "~/Workspace/TODO.org")), occurances: 12),
	]
}
