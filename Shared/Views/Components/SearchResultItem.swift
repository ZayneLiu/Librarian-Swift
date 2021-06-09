//
//  FileItem.swift
//  Librarian
//
//  Created by Zayne on 08/06/2021.
//

import SwiftUI

struct SearchResultItem: View {
	init(result: SearchResult) {
		self.result = result
	}

	private var result: SearchResult

	var body: some View {
		VStack(alignment: .leading, content: {
			Divider()

			HStack(content: {
				HStack(content: {
					Image(systemName: "doc.text.fill")
						.foregroundColor(.accentColor)
						.font(.largeTitle)
						.padding(0)

					VStack(alignment: .leading, spacing: 5, content: {
						HStack(content: {
							ResultField(fieldName: "File", content: {
								Text("\(result.file.url.lastPathComponent)")
							})
						})

						HStack(content: {
							ResultField(fieldName: "Path", content: {
								Text("\(result.file.url.relativePath)")
								Image(systemName: "magnifyingglass.circle.fill").foregroundColor(.gray)
							})
						})

						HStack(content: {
							ResultField(fieldName: "Type", content: {
								#warning("File type")
								Text("Audio/Text")
							})
						})

						HStack(content: {
							ResultField(fieldName: "Match", content: {
								Text("\(result.occurances)")
							})
						})
					})
				}).padding(2)
					.padding(.horizontal, 18)
				Divider()
			})
		})
	}
}

struct FileItem_Previews: PreviewProvider {
	static var previews: some View {
		SearchResultItem(
			result: SearchResult(
				file: File(url: URL(fileURLWithPath: "")),
				occurances: 12
			)
		)
	}
}
