//
//  MainView.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/07/25.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {
    @Bindable var store: StoreOf<MainFeature>
    
	var body: some View {
		VStack {
			Text("Logic Lab Circuit").bold()
				.font(.title)
			Text("Simulator")
				.font(.title3)
			
			// Picker for selecting operation
			Picker("Operation", selection: $store.selectedOperation.sending(\.operationChanged)) {
				ForEach(ALUOperation.allCases, id: \.self) { operation in
					Text(operation.rawValue).tag(operation)
				}
			}
			.pickerStyle(.segmented)
			.padding()
			
			Divider()
			
			ScrollView(.vertical, showsIndicators: false) {
				VStack(spacing: 20) {
					// Dynamically display the selected view
					Group {
						switch store.selectedOperation {
						case .add:
							ADDView(store: store.scope(state: \.addFeature, action: \.addFeature))
						case .sub:
							SUBView(store: store.scope(state: \.subFeature, action: \.subFeature))
						case .andGate:
							ANDView(store: store.scope(state: \.andFeature, action: \.andFeature))
						case .orGate:
							ORView(store: store.scope(state: \.orFeature, action: \.orFeature))
						case .xorGate:
							XORView(store: store.scope(state: \.xorFeature, action: \.xorFeature))
						}
					}
					// .frame(maxHeight: 300)
					
					// Inputs below the picker
					HStack {
						VStack {
							Text("Input A")
							Toggle("", isOn: $store.inputA.sending(\.inputAChanged))
							.labelsHidden()
							.padding()
						}
						
						VStack {
							Text("Input B")
							Toggle("", isOn: $store.inputB.sending(\.inputBChanged))
							.labelsHidden()
							.padding()
						}
						
						if store.selectedOperation == .add || store.selectedOperation == .sub {
							VStack {
								Text(store.selectedOperation == .sub ? "Input Bi" : "Input Ci")
								Toggle("", isOn: $store.inputCi.sending(\.inputCiChanged))
								.labelsHidden()
								.padding()
							}
						}
					}
					
					// Basic Formula of the Logic Circuit
					VStack(alignment: .leading, spacing: 20) {
						VStack(alignment: .leading) {
							Text("Formula:")
								.font(.headline)
							VStack(alignment: .leading, spacing: 5) {
								ForEach(getFormula(for: store.selectedOperation), id: \.self) { formula in
									Text("• \(formula)")
										.font(.body)
										.foregroundColor(.primary)
								}
							}
						}
						
						// Truth Table Section
						VStack(alignment: .leading) {
							TruthTableView(
								truthTable: getTruthTable(for: store.selectedOperation),
								title: "Truth Table:"
							)
						}
					}
					.padding(.horizontal)
				}
				.padding()
			}
			
			Spacer()
		}
		.onTapGesture {
			UIApplication.shared.endEditing()
		}
	}
	
	private func getFormula(for operation: ALUOperation) -> [String] {
		switch operation {
		case .add:
			return ["Sum (S): \(FullAdderFormula.sum)", "Carry Out (Co): \(FullAdderFormula.carryOut)"]
		case .sub:
			return ["Difference (D): \(FullSubtractorFormula.difference)", "Borrow (Bo): \(FullSubtractorFormula.borrow)"]
		case .andGate:
            return ["AND Gate: \(ANDFormula.conjunction)"]
		case .orGate:
            return ["OR Gate: \(ORFormula.disjunction)"]
		case .xorGate:
            return ["XOR Gate: \(XORFormula.exclusiveOr)"]
        }
    }
    
    private func getTruthTable(for operation: ALUOperation) -> TruthTable {
        switch operation {
        case .add:
            return TruthTables.fullAdder
        case .sub:
            return TruthTables.fullSubtractor
        case .andGate:
            return TruthTables.andGate
        case .orGate:
            return TruthTables.orGate
        case .xorGate:
            return TruthTables.xorGate
        }
    }
}

#Preview {
    MainView(
        store: Store(initialState: MainFeature.State()) {
            MainFeature()
        }
    )
}
