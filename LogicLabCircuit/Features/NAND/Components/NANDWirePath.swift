//
//  ANDWirePath.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct NANDWirePath: View {
    let store: StoreOf<NANDFeature>
    let activeColor = Color.green
    let inactiveColor = Color.gray

	var body: some View {
		ZStack {
			Path { path in
				// Input A to AND gate
				path.move(to: CGPoint(x: 100, y: 55))
				path.addLine(to: CGPoint(x: 150, y: 55))
			}
			.stroke(store.inputA ? activeColor : inactiveColor, lineWidth: 3)
			
			Path { path in
				// Input B to AND gate
				path.move(to: CGPoint(x: 100, y: 95))
				path.addLine(to: CGPoint(x: 150, y: 95))
			}
			.stroke(store.inputB ? activeColor : inactiveColor, lineWidth: 3)
			
			Path { path in
				// AND gate output to O
				path.move(to: CGPoint(x: 200, y: 75))
				path.addLine(to: CGPoint(x: 280, y: 75))
			}
			.stroke(store.output ? activeColor : inactiveColor, lineWidth: 3)
		}
	}
}
