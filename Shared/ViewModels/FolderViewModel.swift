//
//  SideViewViewModel.swift
//  Librarian
//
//  Created by Zayne on 06/06/2021.
//

import Foundation
import SwiftUI

class FolderViewModel: ObservableObject {
	public static var model = FolderViewModel()
	private init() {}

	@Published var folders: [Folder] = []

	public func addFolder(folder: Folder) {
		#warning("Subfolder detection")
		// B is a sub folder of A?

		#warning("Call Index API")

		folders.append(folder)
	}

	public func removeFolder(folder: Folder) {
		guard
			let index = folders.firstIndex(where: { f in f == folder })
		else { print("not found"); return }

		#warning("remove folder from index DB")

		folders.remove(at: index)
	}
}

// class FolderViewEnvObj: ObservableObject {
//	static let envObj = FolderViewEnvObj()
//
////	private init() {}
////	@Published var folders: [Folder] = []
// }
