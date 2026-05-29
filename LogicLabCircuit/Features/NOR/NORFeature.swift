//
//  NORFeature.swift
//  LogicLabCircuit
//
//  Created by Michael Griebling on 05/25/26.
//

import ComposableArchitecture
import Foundation

@Reducer
struct NORFeature {
    @ObservableState
    struct State: Equatable {
        var inputA: Bool = false
        var inputB: Bool = false
        var output: Bool = false
    }
    
    enum Action {
        case inputAChanged(Bool)
        case inputBChanged(Bool)
        case computeOutput
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .inputAChanged(value):
                state.inputA = value
                return .run { send in
                    await send(.computeOutput)
                }
                
            case let .inputBChanged(value):
                state.inputB = value
                return .run { send in
                    await send(.computeOutput)
                }
                
            case .computeOutput:
				state.output = ALUModel.compute(
					aIn: state.inputA, bIn: state.inputB,
					operation: .norGate)
                return .none
            }
        }
    }
}
