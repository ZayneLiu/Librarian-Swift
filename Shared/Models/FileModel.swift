//
//  SearchResult.swift
//  Librarian
//
//  Created by Zayne on 31/05/2021.
//

import Foundation

class FileModel: Identifiable {
//	var id = UUID()
	var name: String

	var url = URL(fileURLWithPath: "")

	init(url: URL) {
		name = url.lastPathComponent
		self.url = url
	}
}
