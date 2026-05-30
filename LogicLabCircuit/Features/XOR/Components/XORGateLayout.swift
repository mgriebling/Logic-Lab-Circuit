//
//  XORGateLayout.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct XORGateLayout: View {
    let store: StoreOf<XORFeature>

	var body: some View {
		HStack(alignment: .top, spacing: 40) {
			// Inputs
			VStack(spacing: 20) {
				LogicNode(label: "A", active: store.inputA)
				LogicNode(label: "B", active: store.inputB)
			}
			
			// Gate
			VStack {
				Image(store.output ? "XOR_On" : "XOR").resizable().frame(width: 80, height: 60)
			}
			
			// Output
			VStack {
				LogicNode(label: "O", active: store.output)
			}
			.padding(.top, 20)
		}
	}
}
