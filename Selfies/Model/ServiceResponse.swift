//
//  ServiceResponse.swift
//  Selfies
//
//  Created by Andy Nadal on 8/10/21.
//

import Foundation
import Charts

struct ServiceResponse: Decodable {
    let colors: [String]
    let questions: [Question]
}

struct Question: Decodable, Hashable {
    let total: Int
    let text: String
    let chartData: [ChartData]
}

struct ChartData: Decodable, Hashable {
    let text: String
    let percetnage: Int
}

extension ServiceResponse {
    /// Maps through the `questions` received, and returns usable data for the charts.
    var chartData: [PieChartData] {
        return questions.map { question in
            chartSet(using: question)
        }
    }
    
    /// Creates a Data Set to be used in a Pie Chart.
    /// - Parameter question: The `Question` in question
    /// - Returns: A `PieChartData` object, that contains the information needed to build the chart.
    private func chartSet(using question: Question) -> PieChartData {
        let entries = question.chartData.map { data in
            PieChartDataEntry(value: Double(data.percetnage), label: data.text)
        }
        
        let set = PieChartDataSet(entries: entries, label: question.text)
        set.colors = uiColors
        
        return PieChartData(dataSet: set)
    }
    
    private var uiColors: [UIColor] {
        colors.compactMap { UIColor($0) }
    }
}
