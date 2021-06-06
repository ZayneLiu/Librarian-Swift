//
// Created by Zayne on 02/06/2021.
//

import Foundation
import SwiftUI

struct FolderItem: View {
	init(folder: Folder) {
		self.folder = folder
	}

	@State var isOn: Bool = true
	@State var isSheetPresented: Bool = false
	@State var isHovered: Bool = false

	var folder: Folder

	var body: some View {
		HStack {
			Toggle(isOn: $isOn) {
				#if os(iOS)
					Button(action: { isSheetPresented = true }) {
						Image(systemName: "info.circle").foregroundColor(.blue)
					}.buttonStyle(PlainButtonStyle())
				#endif

				Image(systemName: "folder.fill")
				Text("\(folder.name)")
					.font(.system(size: 13))
					.lineLimit(1)
					.frame(minHeight: 18)

				#if os(macOS)
					Spacer()
					// Button: Remove folder from index database
					if isHovered {
						Button(action: { removeIndexedFolder() }) {
							Image(systemName: "trash.fill").foregroundColor(.red)
						}.buttonStyle(PlainButtonStyle())
					}

					// Button: Preview folder location
					Button(action: { isSheetPresented = true }) {
						Image(systemName: "info.circle").foregroundColor(.blue)
					}.buttonStyle(PlainButtonStyle())
				#endif
			}
			// Detail popover
			.popover(isPresented: $isSheetPresented, content: {
				Text("Path: `\(folder.url.path)`").padding()
			})
		}.onHover(perform: { hovered in isHovered = hovered })
	}

	func getWidth() -> CGFloat {
		CGFloat(isHovered ? 100 : 0)
	}

	func removeIndexedFolder() {
		FolderViewModel.model.removeFolder(folder: folder)
		print(FolderViewModel.model.folders)
	}
}
