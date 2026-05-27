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
				ADDLogicNode(imageName: store.inputA ? "IN_On" : "IN_Off", label: "A")
				ADDLogicNode(imageName: store.inputB ? "IN_On" : "IN_Off", label: "B")
				ADDLogicNode(imageName: store.inputCi ? "IN_On" : "IN_Off", label: "Ci", font: .caption)
			}
			
			// Gates
			VStack(alignment: .leading, spacing: 25) {
				HStack(alignment: .top, spacing: 50) {
					Image(orAB && xorAB ? "XOR_On" : "XOR")
						.resizable()
						.frame(width: 60, height: 60)
					Image(store.outputS ? "XOR_On" : "XOR").resizable().frame(width: 60, height: 60).padding(.top, 35)
				}
				
				HStack(alignment: .top, spacing: 50) {
					VStack(spacing: 30) {
						let and1AllInputsOn = andAB && store.inputCi
						let and1PartialInputsOn = orAB && store.inputCi
						Image(and1AllInputsOn ? "AND" : and1PartialInputsOn ? "AND_On" : "AND")
							.resizable()
							.frame(width: 60, height: 60)
						Image(store.outputCo || andAB ? "AND_On" : "AND")
							.resizable()
							.frame(width: 60, height: 60)
					}
					.padding(.leading, 50)
					
					Image(store.outputCo ? "OR_On" : "OR").resizable().frame(width: 60, height: 60).padding(.top, 30)
				}
			}
			
			// Outputs
			VStack(spacing: 95) {
				ADDLogicNode(imageName: store.outputS ? "OUT_On" : "OUT_Off", label: "S")
				ADDLogicNode(imageName: store.outputCo ? "OUT_On" : "OUT_Off", label: "Co", font: .caption)
			}
			.padding(.top, 55)
		}
	}
}
