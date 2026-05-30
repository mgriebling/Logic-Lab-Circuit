//
//  ANDGateLayout.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct ANDGateLayout: View {
    let store: StoreOf<ANDFeature>

	var body: some View {
		HStack(alignment: .top, spacing: 40) {
			// Inputs
			VStack(spacing: 20) {
				LogicNode(label: "A", active: store.inputA)
				LogicNode(label: "B", active: store.inputB)
			}
			
			// Gate
			VStack {
				Image(store.output ? "AND_On" : "AND").resizable().frame(width: 70, height: 60)
			}
			
			// Output
			VStack {
				LogicNode(label: "O", active: store.output, output: true)
			}
			.padding(.top, 20)
		}
	}
}
