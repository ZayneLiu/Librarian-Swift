//
//  SideBar.swift
//  Librarian
//
//  Created by Zayne on 02/06/2021.
//

import SwiftUI

class SelectedFolder: Identifiable {
	init(url: URL) {
		name = url.lastPathComponent
		self.url = url
	}

	var id = UUID()
	var name: String = ""
	var url = URL(fileURLWithPath: "")
}

struct SideView: View {
	@State var folders: [SelectedFolder] = []
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

			VStack(alignment: .center, content: {
				Button("Select Folder", action: {
					self.isPresented = true
				}).fileImporter(
					isPresented: $isPresented,
					allowedContentTypes: [.folder],
					allowsMultipleSelection: true
				) { res in
					do {
						for url in try res.get() {
							folders.append(SelectedFolder(url: url))
						}
						print(folders)
					} catch {
						print(error)
					}
				}
			})
			VStack(content: {
				ForEach(folders) { folder in
					FolderItem(folder: folder)
				}

				Spacer()
			}).padding(.horizontal, 20)

		}).frame(minWidth: 120, alignment: .init(horizontal: .center, vertical: .top))
			.padding(.vertical, 15)
	}
}

struct SideBar_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			SideView()
			RootView()
		}
	}
}
