//
//  XNORWirePath.swift
//  LogicLabCircuit
//
//  Created by Michael Griebling on 05/25/26.
//

import SwiftUI
import ComposableArchitecture

struct XNORWirePath: View {
    let store: StoreOf<XNORFeature>
    let activeColor = Color.green
    let inactiveColor = Color.gray

	var body: some View {
		ZStack {
			Path { path in
				// Input A to XNOR gate
				path.move(to: CGPoint(x: 90, y: 55))
				path.addLine(to: CGPoint(x: 140, y: 55))
			}
			.stroke(store.inputA ? activeColor : inactiveColor, lineWidth: 3)
			
			Path { path in
				// Input B to XNOR gate
				path.move(to: CGPoint(x: 90, y: 95))
				path.addLine(to: CGPoint(x: 140, y: 95))
			}
			.stroke(store.inputB ? activeColor : inactiveColor, lineWidth: 3)
			
			Path { path in
				// XOR gate output to O
				path.move(to: CGPoint(x: 200, y: 75))
				path.addLine(to: CGPoint(x: 270, y: 75))
			}
			.stroke(store.output ? activeColor : inactiveColor, lineWidth: 3)
		}
	}
}
