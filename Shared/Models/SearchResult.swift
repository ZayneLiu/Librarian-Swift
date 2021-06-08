//
//  SearchResult.swift
//  Librarian
//
//  Created by Zayne on 08/06/2021.
//

import Foundation

class SearchResult: Identifiable {
	var file: File
	var occurances: Int

	init(file: File, occurances: Int) {
		self.file = file
		self.occurances = occurances
	}

	init(searchResult: SearchResult) {
		file = searchResult.file
		occurances = searchResult.occurances
	}
}
