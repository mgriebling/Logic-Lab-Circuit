//
//  XORWirePath.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct XORWirePath: View {
    let store: StoreOf<XORFeature>
    let activeColor = Color.green
    let inactiveColor = Color.gray

	var body: some View {
		ZStack {
			Path { path in
				// Input A to XOR gate
				path.move(to: CGPoint(x: 105, y: 130))
				path.addLine(to: CGPoint(x: 155, y: 130))
			}
			.stroke(store.inputA ? activeColor : inactiveColor, lineWidth: 3)
			
			Path { path in
				// Input B to XOR gate
				path.move(to: CGPoint(x: 105, y: 170))
				path.addLine(to: CGPoint(x: 155, y: 170))
			}
			.stroke(store.inputB ? activeColor : inactiveColor, lineWidth: 3)
			
			Path { path in
				// XOR gate output to O
				path.move(to: CGPoint(x: 200, y: 150))
				path.addLine(to: CGPoint(x: 255, y: 150))
			}
			.stroke(store.output ? activeColor : inactiveColor, lineWidth: 3)
		}
	}
}
