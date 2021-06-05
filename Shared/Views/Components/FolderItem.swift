//
// Created by Zayne on 02/06/2021.
//

import Foundation
import SwiftUI

struct FolderItem: View {
	@State var isOn: Bool = true
	@State var isSheetPresented: Bool = false

	var folder: SelectedFolder

	init(folder: SelectedFolder) {
		self.folder = folder
	}

	var body: some View {
		HStack {
			Toggle(isOn: $isOn) {
				#if os(macOS)
					Button(action: { isSheetPresented = true }) {
						Image(systemName: "info.circle").foregroundColor(.blue)
					}.buttonStyle(PlainButtonStyle())
				#endif

				Image(systemName: "folder")
				Text("\(folder.name)")

				#if os(iOS)
					Button(action: { isSheetPresented = true }) {
						Image(systemName: "info.circle").foregroundColor(.blue)
					}.buttonStyle(PlainButtonStyle())
				#endif

			}.popover(isPresented: $isSheetPresented, content: {
				Text("\(folder.url.path)").padding()
			})
		}
	}
}
