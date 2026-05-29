//
//  XNORView.swift
//  LogicLabCircuit
//
//  Created by Michael Griebling on 05/25/26.
//

import SwiftUI
import ComposableArchitecture

struct XNORView: View {
    let store: StoreOf<XNORFeature>
	
	var body: some View {
		VStack(spacing: 0) {
			Text("XNOR Logic Gate")
				.font(.title3)
				.bold()
			
			ZStack {
				XNORWirePath(store: store)
				XNORGateLayout(store: store)
			}
			.frame(width: 360, height: 150)
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
    XNORView(
        store: Store(initialState: XNORFeature.State(inputA: false, inputB: true)) {
            XNORFeature()
        }
    )
}
