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
		VStack(alignment: .center, spacing: 10, content: {
			HStack(alignment: .center) {
				Text("\(Image(systemName: "books.vertical.fill")) Librarian")
					.font(.title)
			}.frame(height: TOP_BAR_HEIGHT, alignment: .center)
			Divider()

			// Button: Add folder to index
			Button("Select Folder", action: {
				self.isPresented = true
			}).fileImporter(
				isPresented: $isPresented,
				allowedContentTypes: [.folder],
				allowsMultipleSelection: true
			) { res in
				for url in try! res.get() {
					model.addFolder(folder: FolderModel(url: url))
				}
			}

			// Folder list
			VStack(alignment: .leading, spacing: 10, content: {
				ForEach(model.folders) { folder in
					FolderItem(folder: folder)
				}
			})

			Spacer()
		}).padding()
	}
}

struct SideBar_Previews: PreviewProvider {
	static var previews: some View {
		FolderView()
	}
}
