//
//  SideViewViewModel.swift
//  Librarian
//
//  Created by Zayne on 06/06/2021.
//

import Custodian
import Foundation
import SwiftUI

class FolderViewModel: ObservableObject {
	public static var model = FolderViewModel()

	private init() {}

	@Published var folders: [FolderModel] = []

	public func addFolder(folder: FolderModel) {
		#warning("Subfolder detection")
		// B is a sub folder of A?

		folders.append(folder)
		folder.index()
	}

	public func removeFolder(folder: FolderModel) {
		guard let index = folders.firstIndex(where: { f in f == folder })
		else { print("not found"); return }

		#warning("remove folder from index DB")

		folders.remove(at: index)
	}

	public func search(keyword: String) -> [SearchResult] {
		var res: [SearchResult] = []

		folders.forEach { folder in
			if !folder.isOn { return }
			res.insert(contentsOf: folder.search(keyword: keyword), at: 0)
		}
		return res
	}
}
