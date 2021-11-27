//
//  Folder.swift
//  Librarian
//
//  Created by Zayne on 06/06/2021.
//

import Custodian
import Foundation

/// Folder model
class FolderModel: Identifiable {
	static func ==(lhs: FolderModel, rhs: FolderModel) -> Bool {
		lhs.id == rhs.id
	}

	var id = UUID()
	var name: String = ""
	var url = URL(fileURLWithPath: "")
	var folder: Folder

	public init(url: URL) {
		name = url.lastPathComponent
		self.url = url
		folder = Folder(url: self.url)
	}

	func index() {
		print("indexing")
		try! folder.index()
		#warning("Store index data")
		print("indexing done")
	}

	func search(keyword: String) -> [SearchResult] {
		folder.search(keyword: keyword)
	}

	func getFileTypes() -> String {

		var res: Set<String> = Set<String>()

		folder.files.forEach { file in
			res.insert(file.ext)
		}
		return res.joined(separator: ", ")
	}
}
