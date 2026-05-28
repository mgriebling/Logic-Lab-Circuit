//
//  ANDFeature.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/09/25.
//

import ComposableArchitecture
import Foundation

@Reducer
struct NANDFeature {
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
                let intA = state.inputA ? 1 : 0
                let intB = state.inputB ? 1 : 0
                let result = ALUModel.compute(intA: intA, intB: intB, operation: .nandGate)
                state.output = result == 1
                return .none
            }
        }
    }
}
