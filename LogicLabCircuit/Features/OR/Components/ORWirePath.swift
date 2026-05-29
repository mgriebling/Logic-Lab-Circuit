//
//  ORWirePath.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct ORWirePath: View {
    let store: StoreOf<ORFeature>
	
	var body: some View {
		ZStack {
			// Input A to gate
			Line.hline(from: CGPoint(x: 95, y: 55), length: 65, active: store.inputA)

			// Input B to gate
			Line.hline(from: CGPoint(x: 95, y: 95), length: 65, active: store.inputB)

			// gate output to O
			Line.hline(from: CGPoint(x: 200, y: 75), length: 65, active: store.output)
		}
	}
}
