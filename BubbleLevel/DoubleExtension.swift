//
//  DoubleExtension.swift
//  BubbleLevel
//
//  Created by Xcode2021 on 2022/05/26.
//

import Foundation

extension Double {
    func describeAsFixedLengthString(integerDigits: Int = 2, fractionDigits: Int = 2) -> String {
        self.formatted(
            .number
                .sign(strategy: .always())
                .precision(
                    .integerAndFractionLength(integer: integerDigits, fraction: fractionDigits)
                )
        )
    }
}
