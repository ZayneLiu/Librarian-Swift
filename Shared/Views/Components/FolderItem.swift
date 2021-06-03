//
// Created by Zayne on 02/06/2021.
//

import Foundation
import SwiftUI

struct FolderItem: View {
	@State(initialValue: true) var isOn: Bool
	var folderName = ""

	init(folder: String) {
		folderName = folder
	}

	var body: some View {
		HStack {
			Toggle("\(folderName)", isOn: $isOn)
		}
	}
}
