//
//  ADDView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/07/25.
//

import SwiftUI
import ComposableArchitecture

struct ADDView: View {
    let store: StoreOf<ADDFeature>
	
	var body: some View {
		VStack(spacing: 0) {
			Text("Full Adder Circuit")
				.font(.title3)
				.bold()
			
			ZStack {
				ADDWirePath(store: store)
				ADDGateLayout(store: store)
			}
			.frame(width: 300, height: 300)
			.onAppear {
				store.send(.computeOutput)
			}
			.onChange(of: store.inputA) {
				store.send(.computeOutput)
			}
			.onChange(of: store.inputB) {
				store.send(.computeOutput)
			}
			.onChange(of: store.inputCi) {
				store.send(.computeOutput)
			}
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.padding()
	}
}

#Preview {
    ADDView(
        store: Store(initialState: ADDFeature.State()) {
            ADDFeature()
        }
    )
}
