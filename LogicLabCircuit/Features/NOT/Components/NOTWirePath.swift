//
//  NOTWirePath.swift
//  LogicLabCircuit
//
//  Created by Michael Griebling on 05/25/26.
//

import SwiftUI
import ComposableArchitecture

struct NOTWirePath: View {
    let store: StoreOf<NOTFeature>
    let activeColor = Color.green
    let inactiveColor = Color.gray
	
	var body: some View {
		ZStack {
			Path { path in
				// Input A to NOT gate
				path.move(to: CGPoint(x: 95, y: 75))
				path.addLine(to: CGPoint(x: 160, y: 75))
			}
			.stroke(store.inputA ? activeColor : inactiveColor, lineWidth: 3)
			
			Path { path in
				// NOT gate output to O
				path.move(to: CGPoint(x: 200, y: 75))
				path.addLine(to: CGPoint(x: 265, y: 75))
			}
			.stroke(store.output ? activeColor : inactiveColor, lineWidth: 3)
		}
	}
}
