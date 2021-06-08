//
//  SideBar.swift
//  Librarian
//
//  Created by Zayne on 02/06/2021.
//

import SwiftUI

struct FolderView: View {
	@ObservedObject var model = FolderViewModel.model
	@State var isPresented = false

	var body: some View {
		VStack(spacing: 10, content: {
			// Sidebar Title
			VStack(content: {
				Text("Folders")
					.fontWeight(.bold)
					.font(.title2)
			}).frame(maxHeight: TOP_BAR_HEIGHT)

			#warning("TODO: Side bar")
			Divider()

			// Button: Add folder to index
			Button("Select Folder", action: {
				self.isPresented = true
			})
				// START: FileImporter
				.fileImporter(
					isPresented: $isPresented,
					allowedContentTypes: [.folder],
					allowsMultipleSelection: true
				) { res in
					for url in try! res.get() { model.addFolder(folder: Folder(url: url)) }
				} // END: FileImporter

			// Folder list
			List(model.folders) { folder in
				FolderItem(folder: folder)
			}

			Spacer()
		}).frame(minWidth: 200)
	}
}

struct SideBar_Previews: PreviewProvider {
	static var previews: some View {
		FolderView().frame(width: 200)
	}
}
