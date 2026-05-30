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

	var body: some View {
		ZStack {
			// Input A to gate
			Line.hline(from: CGPoint(95, 55), length: 50, active: store.inputA)

			// Input B to gate
			Line.hline(from: CGPoint(95, 95), length: 50, active: store.inputB)

			// gate output to O
			Line.hline(from: CGPoint(200, 75), length: 65, active: store.output)
		}
	}
}
