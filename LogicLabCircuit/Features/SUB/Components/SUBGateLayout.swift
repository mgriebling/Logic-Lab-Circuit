//
//  SUBGateLayout.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct SUBGateLayout: View {
    let store: StoreOf<SUBFeature>
    
    var body: some View {
		let orAB = store.inputA || store.inputB
		let xorAB = store.inputA != store.inputB
		let xnorAB = !(store.inputA != store.inputB)
		let notA = !store.inputA
		HStack(alignment: .top, spacing: 20) {
			// Inputs
			VStack(spacing: 10) {
				LogicNode(label: "Bi", active: store.inputBi, font: .caption)
					.padding(.bottom, 10)
				LogicNode(label: "A", active: store.inputA)
				LogicNode(label: "B", active: store.inputB)
			}
			
			// Gates
			VStack(alignment: .leading) {
				HStack(alignment: .top, spacing: 150) {
					Image(xorAB ? "XOR_On" : "XOR").resizable().frame(width: 60, height: 45)
						.padding(.leading, 20)
						.padding(.top, 45)
					Image(store.outputD ? "XOR_On" : "XOR").resizable().frame(width: 60, height: 45)
				}
				
				HStack(alignment: .top, spacing: 20) {
					Spacer()
					Image(orAB ? "NOT_On" : "NOT").resizable().frame(width: 30, height: 30)
					Image(xnorAB && store.inputBi ? "AND_On" : "AND").resizable().frame(width: 55, height: 45)
					Image(store.outputBo ? "OR_On" : "OR").resizable().frame(width: 60, height: 45)
						.padding(.top, 10)
				}
				
				HStack(alignment: .top, spacing: 15) {
					Image(store.inputA ? "NOT_On" : "NOT").resizable().frame(width: 30, height: 30)
					Image(store.inputB && notA ? "AND_On" : "AND").resizable().frame(width: 55, height: 45)
				}
				.padding(.leading, 25)
			}
			
			// Outputs
			VStack(spacing: 87.5) {
				LogicNode(label: "D", active: store.outputD, output: true)
				LogicNode(label: "Bo", active: store.outputBo, font: .caption, output: true)
			}
			.padding(.top, 12.5)
		}
	}
}
