//
//  ORGateLayout.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct ORGateLayout: View {
    let store: StoreOf<ORFeature>

	var body: some View {
		HStack(alignment: .top, spacing: 40) {
			// Inputs
			VStack(spacing: 20) {
				logicNode(imageName: store.inputA ? "IN_On" : "IN_Off", label: "A")
				logicNode(imageName: store.inputB ? "IN_On" : "IN_Off", label: "B")
			}
			
			// Gate
			VStack {
				Image(store.output ? "OR_On" : "OR").resizable().frame(width: 80, height: 60)
			}
			
			// Output
			VStack {
				logicNode(imageName: store.output ? "OUT_On" : "OUT_Off", label: "O")
			}
			.padding(.top, 20)
		}
	}

    private func logicNode(imageName: String, label: String, font: Font = .footnote) -> some View {
        ZStack {
            Image(imageName)
                .resizable()
                .frame(width: 20, height: 20)
            Text(label)
                .font(font)
                .foregroundStyle(Color(.black))
        }
    }
}
