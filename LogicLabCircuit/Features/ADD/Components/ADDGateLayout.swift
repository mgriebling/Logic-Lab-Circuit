//
//  ADDGateLayout.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 22/07/25.
//

import SwiftUI
import ComposableArchitecture

struct ADDGateLayout: View {
    let store: StoreOf<ADDFeature>
	
	var body: some View {
		let andAB = store.inputA && store.inputB
		let orAB = store.inputA || store.inputB
		let xorAB = store.inputA != store.inputB
		HStack(alignment: .top, spacing: 40) {
			// Inputs
			VStack(spacing: 20) {
				LogicNode(label: "A", active: store.inputA)
				LogicNode(label: "B", active: store.inputB)
				LogicNode(label: "Ci", active: store.inputCi, font: .caption)
			}
			
			// Gates
			VStack(alignment: .leading, spacing: 25) {
				HStack(alignment: .top, spacing: 50) {
					Image(orAB && xorAB ? "XOR_On" : "XOR")
						.resizable()
						.frame(width: 75, height: 60)
					Image(store.outputS ? "XOR_On" : "XOR")
						.resizable()
						.frame(width: 75, height: 60)
						.padding(.top, 35)
				}
				
				HStack(alignment: .top, spacing: 50) {
					VStack(spacing: 30) {
						let and1AllInputsOn = andAB && store.inputCi
						let and1PartialInputsOn = orAB && store.inputCi
						Image(and1AllInputsOn ? "AND" : and1PartialInputsOn ? "AND_On" : "AND")
							.resizable()
							.frame(width: 70, height: 60)
						Image(store.outputCo || andAB ? "AND_On" : "AND")
							.resizable()
							.frame(width: 70, height: 60)
					}
					.padding(.leading, 50)
					
					Image(store.outputCo ? "OR_On" : "OR").resizable().frame(width: 70, height: 60).padding(.top, 30)
				}
			}
			
			// Outputs
			VStack(spacing: 95) {
				LogicNode(label: "S", active: store.outputS, output: true)
				LogicNode(label: "Co", active: store.outputCo, font: .caption, output: true)
			}
			.padding(.top, 55)
		}
	}
}
