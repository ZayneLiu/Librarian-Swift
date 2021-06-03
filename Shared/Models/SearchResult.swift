//
//  SearchResult.swift
//  Librarian
//
//  Created by Zayne on 31/05/2021.
//

import Foundation

class SearchResult: Identifiable {
	var id = UUID()
	var result: String
	init(result: String) {
		self.result = result
	}
}
