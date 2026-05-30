//
//  Extension.swift
//  LogicLabCircuit
//
//  Created by Ferdinand Lunardy on 22/07/25.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension String {
    func padLeft(toSize: Int) -> String {
        let pad = String(repeating: "0", count: max(0, toSize - self.count))
        return pad + self
    }
}

extension CGPoint {
	init(_ x: CGFloat, _ y: CGFloat) {
		self.init(x: x, y: y)
	}
}
