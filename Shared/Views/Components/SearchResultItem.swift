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
				Image(systemName: "doc.text.fill")
					.foregroundColor(.accentColor)
					.font(.largeTitle)
					.padding(0)

				VStack(alignment: .leading, spacing: 5, content: {
					HStack(content: {
						Text("File\t")
							.font(Font.custom("Monaco", size: 13))
							.padding(.horizontal, 5)
							// .background(Color.gray)
							.foregroundColor(.accentColor)
							.cornerRadius(3.0)
						Text("\(result.file.url.lastPathComponent)")
					})

					HStack(content: {
						Text("Path\t")
							.font(Font.custom("Monaco", size: 13))
							.padding(.horizontal, 5)
							// .background(Color.gray)
							.foregroundColor(.accentColor)
							.cornerRadius(3.0)
						Text("\(result.file.url.relativePath)")
						Image(systemName: "magnifyingglass.circle.fill").foregroundColor(.gray)
					})

					HStack(content: {
						Text("Matches")
							.font(Font.custom("Monaco", size: 13))
							.padding(.horizontal, 5)
							// .background(Color.gray)
							.foregroundColor(.accentColor)
							.cornerRadius(3.0)
						Text("\(result.occurances)")
					})
				})
			}).padding(2)

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
