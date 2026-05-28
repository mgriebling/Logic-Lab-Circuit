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
				path.move(to: CGPoint(x: 95, y: 55))
				path.addLine(to: CGPoint(x: 145, y: 55))
			}
			.stroke(store.inputA ? activeColor : inactiveColor, lineWidth: 3)
			
			Path { path in
				// Input B to XOR gate
				path.move(to: CGPoint(x: 95, y: 95))
				path.addLine(to: CGPoint(x: 145, y: 95))
			}
			.stroke(store.inputB ? activeColor : inactiveColor, lineWidth: 3)
			
			Path { path in
				// XOR gate output to O
				path.move(to: CGPoint(x: 200, y: 75))
				path.addLine(to: CGPoint(x: 265, y: 75))
			}
			.stroke(store.output ? activeColor : inactiveColor, lineWidth: 3)
		}
	}
}
