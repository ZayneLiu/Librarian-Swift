//
//  FileItem.swift
//  Librarian
//
//  Created by Zayne on 08/06/2021.
//

import Custodian
import QuickLook
import SwiftUI

struct SearchResultItem: View {
	init(result: SearchResult) {
		self.result = result
	}

	@State var isPresented = true
	private var result: SearchResult

	private func getShortFilePath() -> String {
		let pathComps = result.file.url.pathComponents
		let shortPathComps = pathComps[Int(pathComps.count - 2)...]
		return (pathComps.count == shortPathComps.count ? "" : ".../") + shortPathComps.joined(separator: "/")
	}

	private func openPreview() {}

	var body: some View {
		VStack(alignment: .leading) {
			HStack(spacing: 0, content: {
				Image(systemName: "doc.richtext.fill")
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
							Text("\(getShortFilePath())")
							Button(action: { openPreview() }) {
								Image(systemName: "magnifyingglass.circle.fill").foregroundColor(.gray)
							}
						})
					})

					HStack(content: {
						ResultField(fieldName: "Type", content: {
							Text("\(result.file.type)")
						})
					})

					HStack(content: {
						ResultField(fieldName: "Topic", content: {
							Text("\(result.file.textClassification.capitalized)")
						})
					})
					HStack(content: {
						ResultField(fieldName: "Match", content: {
							Text("\(result.occurrences.count)")
						})
					})
				})
			})
			DisclosureGroup("Matches") {
				ScrollView {
					LazyVStack(alignment: .leading, content: {
						ForEach(result.occurrences.indices) { i in
							Divider()
							HStack {
								Text("\(i + 1)")
								Divider()
								HighLightText(str: result.occurrences[i].trimmingCharacters(in: .newlines), higlight: result.keyword)
							}
						}
					})
				}.frame(maxHeight: 300)
			}.padding(.leading)
		}.padding(2)
	}

	func HighLightText(str: String, higlight: String) -> Text {
		guard !str.isEmpty, !higlight.isEmpty
		else { return Text(str) }

		var result = Text("")

		let parts = str.split(separator: " ")

		parts.forEach { word in
			// Get rid of `punctuationCharacters` e.g., ",", ".", etc.
			if word.trimmingCharacters(in: .punctuationCharacters).lowercased() == higlight.lowercased() {
				result = result + Text(word + " ").bold().foregroundColor(Color.blue)
			}
			else {
				result = result + Text(word + " ")
			}
		}

		return result
	}
}

struct SearchResult_Previews: PreviewProvider {
	static var previews: some View {
		SearchResultItem(
				result: SearchResult(file: File(url: URL(fileURLWithPath: "~/Workspace/TODO.org")), keyword: "Hamlet", occurrences: [])
		)
	}
}
