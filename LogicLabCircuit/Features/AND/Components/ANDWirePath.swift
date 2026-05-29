//
//  ANDWirePath.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct ANDWirePath: View {
    let store: StoreOf<ANDFeature>

	var body: some View {
		ZStack {
			// Input A to gate
			Line.hline(from: CGPoint(x: 100, y: 55), length: 50, active: store.inputA)

			// Input B to gate
			Line.hline(from: CGPoint(x: 100, y: 95), length: 50, active: store.inputB)

			// gate output to O
			Line.hline(from: CGPoint(x: 200, y: 75), length: 60, active: store.output)
		}
	}
}
