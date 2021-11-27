//
// Created by Zayne on 02/06/2021.
//

import Foundation
import SwiftUI

struct FolderItem: View {
	init(folder: FolderModel) {
		self.folder = folder
	}

	@State var isOn: Bool = true
	@State var isSheetPresented: Bool = false
	var folder: FolderModel
	var body: some View {
		VStack {
			Toggle(isOn: $isOn) {
				HStack(alignment: .top) {
					#if os(iOS)
						Button(action: { isSheetPresented = true }) {
							Image(systemName: "info.circle").foregroundColor(.blue)
						}.buttonStyle(PlainButtonStyle())
					#endif

					Text("\(Image(systemName: "folder.fill")) \(folder.name)").font(.body).lineLimit(1)

					// #if os(macOS)
					// 	// Button: Remove folder from index database
					// 	if isHovered {
					// 		Button(action: { removeIndexedFolder() }) {
					// 			Image(systemName: "trash.fill").foregroundColor(.red)
					// 		}.buttonStyle(PlainButtonStyle())
					// 	}
					//
					// 	// Button: Preview folder location
					// 	Button(action: { isSheetPresented = true }) {
					// 		Image(systemName: "info.circle").foregroundColor(.blue)
					// 	}.buttonStyle(PlainButtonStyle())
					// #endif
				}
			}
			Divider().padding(0)
			DisclosureGroup("Detail") {
				HStack(alignment: .center) {
					VStack(alignment: .leading, content: {
						#warning("deatils of given folder")
						VStack(alignment: .leading, content: {
							HStack {
								Text("Total file:")
								Spacer()
								Text("\(folder.folder.files.count)")
							}
							HStack {
								Text("File types:")
								Spacer()
								Text("\(folder.getFileTypes())")
								//	TODO: summary of supported files
							}
						})
					})

					Spacer()
				}
			}.padding(.vertical, 0).padding(.horizontal, 30).popover(isPresented: $isSheetPresented, content: {
				// Detail popover
				Text("Path: `\(folder.url.path)`").padding()
			})
		}
		// .onHover(perform: { hovered in isHovered = hovered })
	}
	// func getWidth() -> CGFloat {
	// 	CGFloat(isHovered ? 100 : 0)
	// }
	func removeIndexedFolder() {
		FolderViewModel.model.removeFolder(folder: folder)
		print(FolderViewModel.model.folders)
	}
}
