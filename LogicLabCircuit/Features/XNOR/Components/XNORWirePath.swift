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

	var body: some View {
		ZStack {
			// Input A to gate
			Line.hline(from: CGPoint(x: 90, y: 55), length: 50, active: store.inputA)

			// Input B to gate
			Line.hline(from: CGPoint(x: 90, y: 95), length: 50, active: store.inputB)

			// gate output to O
			Line.hline(from: CGPoint(x: 200, y: 75), length: 70, active: store.output)
		}
	}
}
