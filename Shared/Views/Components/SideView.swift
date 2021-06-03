//
//  SideBar.swift
//  Librarian
//
//  Created by Zayne on 02/06/2021.
//

import SwiftUI

struct SideView: View {
	var body: some View {
		VStack(spacing: 10, content: {
			// Sidebar Title
			VStack(content: {
				Text("Folders")
					.fontWeight(.bold)
					.font(.title2)
			}).frame(maxHeight: TOP_BAR_HEIGHT)

			// TODO: Side bar
			Divider()
			VStack(content: {
				FolderItem(folder: "Folder1")
				FolderItem(folder: "Folder2")
				FolderItem(folder: "Folder3")
				FolderItem(folder: "Folder4")
				Spacer()
			})

		}).frame(minWidth: 120, alignment: .init(horizontal: .center, vertical: .top))
			.frame(maxWidth: 160)
			.padding(.vertical, 15)
	}
}

struct SideBar_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			SideView().frame(width: 120)
			RootView()
		}
	}
}
