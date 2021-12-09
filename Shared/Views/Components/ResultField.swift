//
//  ResultField.swift
//  Librarian
//
//  Created by Zayne on 09/06/2021.
//

import SwiftUI

struct ResultField<Content>: View where Content: View {
	var fieldName: String
	@ViewBuilder var content: () -> Content

	@inlinable init(fieldName: String, @ViewBuilder content: @escaping () -> Content) {
		self.fieldName = fieldName
		self.content = content
	}

	var body: some View {
		HStack(content: {
			HStack {
				Text("\(fieldName)")
						.font(Font.custom("Monaco", size: 15))
						.padding(.horizontal, 5)
						.foregroundColor(.accentColor)
						.cornerRadius(3.0)
			}.frame(minWidth: 55, alignment: .trailing)

			content()
		})
	}
}

struct ResultField_Previews: PreviewProvider {
	static var previews: some View {
		ResultField(fieldName: "a", content: { Text("aaa") })
	}
}
