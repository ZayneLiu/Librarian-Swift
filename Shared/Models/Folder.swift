//
//  Folder.swift
//  Librarian
//
//  Created by Zayne on 06/06/2021.
//

import Foundation
/// Folder model
class Folder: Identifiable {
	static func == (lhs: Folder, rhs: Folder) -> Bool {
		lhs.id == rhs.id
	}

	var id = UUID()
	var name: String = ""
	var url = URL(fileURLWithPath: "")

	init(url: URL) {
		name = url.lastPathComponent
		self.url = url
	}
}
