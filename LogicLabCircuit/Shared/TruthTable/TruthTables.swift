//
//  TruthTables.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 07/09/25.
//

import SwiftUI

// MARK: - Truth Table Models
struct TruthTableRow {
    let inputs: [Bool]
    let outputs: [Bool]
	
	// derived for truth table convenience
	var inInt: [Int] { inputs.map { $0 ? 1 : 0 } }
	var outInt: [Int] { outputs.map { $0 ? 1 : 0 } }
}

struct TruthTable {
    let inputHeaders: [String]
    let outputHeaders: [String]
    let rows: [TruthTableRow]
}

// MARK: - Truth Table Data
struct TruthTables {
	// Generate a truth table based on the ALUModel definition of the
	// associated ALUOperation.
	static func generateTable (for gate: ALUOperation,
							   inputs: [String] = ["A", "B"],
							   outputs: [String] = ["Output"]) -> TruthTable {
		var rows: [TruthTableRow] = []
		let numInputs = inputs.count
		let rowCount = Int(pow(2.0, Double(numInputs)))
		
		// Generate the truth table rows based on the ALUModel
		for row in 0..<rowCount {
			let binIn = String(row, radix: 2).padLeft(toSize: numInputs).map { $0 == "1" }
			let output: [Bool]
			switch inputs.count {
			case 1: output = ALUModel.compute(aIn: binIn[0], operation: gate)
			case 2: output = ALUModel.compute(aIn: binIn[0],
											  bIn: binIn[1],
											  operation: gate)
			case 3: output = ALUModel.compute(aIn: binIn[0],
											  bIn: binIn[1],
											  cIn: binIn[2],
											  operation: gate)
			default:
				fatalError("Only 1 to 3 inputs supported for now")
			}
			rows.append(TruthTableRow(inputs: binIn, outputs: output))
		}
		return TruthTable(inputHeaders: inputs, outputHeaders: outputs, rows: rows)
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
					cells(for: truthTable.inputHeaders)
                    
                    // Output headers
					cells(for: truthTable.outputHeaders, isInput: false)
                }
                
                // Data rows
                ForEach(Array(truthTable.rows.enumerated()), id: \.offset) { _, row in
                    HStack(spacing: 1) {
                        // Input values
						cells(for: row.inInt)
                        
                        // Output values
						cells(for: row.outInt, isInput: false)
                    }
                }
            }
        }
    }
	
	@ViewBuilder
	private func cells(for content: [String], isInput: Bool = true) -> some View {
		HStack(spacing: 1) {
			ForEach(content, id: \.self) { header in
				tableCell(header, isInput: isInput)
			}
		}
	}
	
	@ViewBuilder
	private func cells(for content: [Int], isInput: Bool = true) -> some View {
		HStack(spacing: 1) {
			ForEach(Array(content.enumerated()), id: \.offset) { _, output in
				tableCell("\(output)", isInput: isInput, isHeader: false)
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
