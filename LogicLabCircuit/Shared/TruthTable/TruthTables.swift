//
//  TruthTables.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 07/09/25.
//

import SwiftUI

// MARK: - Truth Table Models
struct TruthTableRow {
    let inputs: [Int]
    let outputs: [Int]
}

struct TruthTable {
    let inputHeaders: [String]
    let outputHeaders: [String]
    let rows: [TruthTableRow]
}

// MARK: - Truth Table Data
struct TruthTables {
    
    // Full Adder Truth Table
    static let fullAdder = TruthTable(
        inputHeaders: ["A", "B", "C-IN"],
        outputHeaders: ["Sum", "C-OUT"],
        rows: [
            TruthTableRow(inputs: [0, 0, 0], outputs: [0, 0]),
            TruthTableRow(inputs: [0, 0, 1], outputs: [1, 0]),
            TruthTableRow(inputs: [0, 1, 0], outputs: [1, 0]),
            TruthTableRow(inputs: [0, 1, 1], outputs: [0, 1]),
            TruthTableRow(inputs: [1, 0, 0], outputs: [1, 0]),
            TruthTableRow(inputs: [1, 0, 1], outputs: [0, 1]),
            TruthTableRow(inputs: [1, 1, 0], outputs: [0, 1]),
            TruthTableRow(inputs: [1, 1, 1], outputs: [1, 1])
        ]
    )
    
    // Full Subtractor Truth Table
    static let fullSubtractor = TruthTable(
        inputHeaders: ["A", "B", "B-IN"],
        outputHeaders: ["D", "B-OUT"],
        rows: [
            TruthTableRow(inputs: [0, 0, 0], outputs: [0, 0]),
            TruthTableRow(inputs: [0, 0, 1], outputs: [1, 1]),
            TruthTableRow(inputs: [0, 1, 0], outputs: [1, 1]),
            TruthTableRow(inputs: [0, 1, 1], outputs: [0, 1]),
            TruthTableRow(inputs: [1, 0, 0], outputs: [1, 0]),
            TruthTableRow(inputs: [1, 0, 1], outputs: [0, 0]),
            TruthTableRow(inputs: [1, 1, 0], outputs: [0, 0]),
            TruthTableRow(inputs: [1, 1, 1], outputs: [1, 1])
        ]
    )
	
	// Generate a truth table based on the ALU definition
	static func generateTable(for gate: ALUOperation, inputs: Int = 2) -> TruthTable {
		assert(inputs == 2, "Only 2-bit inputs supported for now")
		var rows: [TruthTableRow] = []
		let rowCount = Int(pow(2.0, Double(inputs)))
		for row in 0..<rowCount {
			let binRow = String(row+rowCount, radix: 2).map { $0 == "1" ? 1 : 0 }
			let ain = binRow[1], bin = binRow[2]
			let output = ALUModel.compute(intA: ain, intB: bin, operation: gate)
			rows.append(TruthTableRow(inputs: [ain, bin], outputs: [output]))
		}
		return TruthTable(inputHeaders: ["A", "B"], outputHeaders: ["Output"], rows: rows)
	}
}

// MARK: - Truth Table View Component
struct TruthTableView: View {
    let truthTable: TruthTable
    let title: String
	
	var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            
            VStack(spacing: 0) {
                // Header row
                HStack(spacing: 1) {
                    // Input headers
                    HStack(spacing: 1) {
                        ForEach(truthTable.inputHeaders, id: \.self) { header in
							tableCell(header)
                        }
                    }
                    
                    // Output headers
                    HStack(spacing: 1) {
                        ForEach(truthTable.outputHeaders, id: \.self) { header in
							tableCell(header, isInput: false)
                        }
                    }
                }
                
                // Data rows
                ForEach(Array(truthTable.rows.enumerated()), id: \.offset) { _, row in
                    HStack(spacing: 1) {
                        // Input values
                        HStack(spacing: 1) {
                            ForEach(Array(row.inputs.enumerated()), id: \.offset) { _, input in
								tableCell("\(input)", isHeader: false)
                            }
                        }
                        
                        // Output values
                        HStack(spacing: 1) {
                            ForEach(Array(row.outputs.enumerated()), id: \.offset) { _, output in
								tableCell("\(output)", isInput: false, isHeader: false)
                            }
                        }
                    }
                }
            }
        }
    }
	
	func tableCell(_ header: String, isInput: Bool = true, isHeader: Bool = true) -> some View {
		let opacity = isHeader ? 0.3 : 0.1
		return Text(header)
			.frame(width: (isInput ? 40 : 50), height: isHeader ? 30 : 25)
			.background(isInput ? Color.blue.opacity(opacity) : .gray.opacity(opacity))
			.border(Color.gray, width: 0.5)
			.font(.caption)
			.fontWeight(isHeader ? .bold : .regular)
	}
}
