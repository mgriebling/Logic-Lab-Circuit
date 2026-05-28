//
//  MainFeature.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/09/25.
//

import ComposableArchitecture
import Foundation

@Reducer
struct MainFeature {
    @ObservableState
    struct State: Equatable {
        var inputA: Bool = false
        var inputB: Bool = false
        var inputCi: Bool = false
        var selectedOperation: ALUOperation = .add
        var result: Int = 0
        var isTapped: Bool = false
        
        // Child feature states
        var addFeature = ADDFeature.State()
        var subFeature = SUBFeature.State()
        var andFeature = ANDFeature.State()
		var nandFeature = NANDFeature.State()
        var orFeature = ORFeature.State()
		var norFeature = NORFeature.State()
        var xorFeature = XORFeature.State()
		var xnorFeature = XNORFeature.State()
    }
    
    enum Action {
        case inputAChanged(Bool)
        case inputBChanged(Bool)
        case inputCiChanged(Bool)
        case operationChanged(ALUOperation)
        case isTappedChanged(Bool)
        case computeResult
        
        // Child feature actions
        case addFeature(ADDFeature.Action)
        case subFeature(SUBFeature.Action)
        case andFeature(ANDFeature.Action)
		case nandFeature(NANDFeature.Action)
        case orFeature(ORFeature.Action)
		case norFeature(NORFeature.Action)
        case xorFeature(XORFeature.Action)
		case xnorFeature(XNORFeature.Action)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.addFeature, action: \.addFeature) {
            ADDFeature()
        }
        
        Scope(state: \.subFeature, action: \.subFeature) {
            SUBFeature()
        }
        
        Scope(state: \.andFeature, action: \.andFeature) {
            ANDFeature()
        }
		
		Scope(state: \.nandFeature, action: \.nandFeature) {
			NANDFeature()
		}
        
        Scope(state: \.orFeature, action: \.orFeature) {
            ORFeature()
        }
		
		Scope(state: \.norFeature, action: \.norFeature) {
			NORFeature()
		}
        
        Scope(state: \.xorFeature, action: \.xorFeature) {
            XORFeature()
        }
		
		Scope(state: \.xnorFeature, action: \.xnorFeature) {
			XNORFeature()
		}
        
        Reduce { state, action in
            switch action {
            case let .inputAChanged(value):
                state.inputA = value
                // Update all child features
                state.addFeature.inputA = value
                state.subFeature.inputA = value
                state.andFeature.inputA = value
				state.nandFeature.inputA = value
                state.orFeature.inputA = value
				state.norFeature.inputA = value
                state.xorFeature.inputA = value
				state.xnorFeature.inputA = value
                return .run { send in
                    await send(.computeResult)
                }
                
            case let .inputBChanged(value):
                state.inputB = value
                // Update all child features
                state.addFeature.inputB = value
                state.subFeature.inputB = value
                state.andFeature.inputB = value
				state.nandFeature.inputB = value
                state.orFeature.inputB = value
				state.norFeature.inputB = value
                state.xorFeature.inputB = value
				state.xnorFeature.inputB = value
                return .run { send in
                    await send(.computeResult)
                }
                
            case let .inputCiChanged(value):
                state.inputCi = value
                // Update relevant child features
                state.addFeature.inputCi = value
                state.subFeature.inputBi = value
                return .run { send in
                    await send(.computeResult)
                }
                
            case let .operationChanged(operation):
                state.selectedOperation = operation
                return .run { send in
                    await send(.computeResult)
                }
                
            case let .isTappedChanged(value):
                state.isTapped = value
                return .none
                
            case .computeResult:
                let intA = state.inputA ? 1 : 0
                let intB = state.inputB ? 1 : 0
                state.result = ALUModel.compute(intA: intA, intB: intB, operation: state.selectedOperation)
                return .none
                
            case .addFeature, .subFeature, .andFeature, .nandFeature, .orFeature, .norFeature, .xorFeature, .xnorFeature:
                return .none
            }
        }
    }
}
