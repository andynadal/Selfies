//
//  PercentageValueFormatter.swift
//  Selfies
//
//  Created by Andy Nadal on 8/11/21.
//

import Charts

final class PercentageValueFormatter: IValueFormatter {
    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        "\(Int(value))%"
    }
}
