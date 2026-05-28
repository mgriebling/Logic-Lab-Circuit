//
//  ORFeature.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 06/09/25.
//

import ComposableArchitecture
import Foundation

@Reducer
struct NOTFeature {
    @ObservableState
    struct State: Equatable {
        var inputA: Bool = false
        var output: Bool = false
    }
    
    enum Action {
        case inputAChanged(Bool)
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
                
            case .computeOutput:
                let intA = state.inputA ? 1 : 0
                let result = ALUModel.compute(intA: intA, operation: .notGate)
                state.output = result == 1
                return .none
            }
        }
    }
}
