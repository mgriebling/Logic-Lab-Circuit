//
//  ADDLogicNode.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 22/07/25.
//  M. Griebling - fixed text alignment within the input blocks
//

import SwiftUI

struct LogicNode: View {
    var label: String
	var active: Bool
    var font: Font = .footnote
	var output: Bool = false

	var body: some View {
		let name = output ? "OUT" : "IN"
		Image(active ? "\(name)_On" : "\(name)_Off")
			.resizable()
			.frame(width: 20, height: 20)
			.overlay {
				HStack {
					if output {
						Text(label)
							.padding(.leading, 3)
					} else {
						Text(label)
							.padding(.trailing, 3)
					}
				}
				.font(font)
				.foregroundStyle(Color(.black))
			}
	}
}
