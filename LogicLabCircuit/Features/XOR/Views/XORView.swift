//
//  XORView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 26/07/25.
//

import SwiftUI
import ComposableArchitecture

struct XORView: View {
    let store: StoreOf<XORFeature>
	
	var body: some View {
		VStack(spacing: 0) {
			Text("XOR Logic Gate")
				.font(.title3)
				.bold()
			
			ZStack {
				XORWirePath(store: store)
				XORGateLayout(store: store)
			}
			.frame(width: 360, height: 300)
			.onAppear {
				store.send(.computeOutput)
			}
			.onChange(of: store.inputA) {
				store.send(.computeOutput)
			}
			.onChange(of: store.inputB) {
				store.send(.computeOutput)
			}
		}
	}
}

#Preview {
    XORView(
        store: Store(initialState: XORFeature.State(inputA: false, inputB: true)) {
            XORFeature()
        }
    )
}
