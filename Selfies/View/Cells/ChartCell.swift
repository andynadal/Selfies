//
//  ChartCell.swift
//  Selfies
//
//  Created by Andy Nadal on 8/11/21.
//

import UIKit
import Charts

final class ChartCell: UITableViewCell {
    static let id = "chartCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureLayout()
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title2)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pieChart: PieChartView = {
        let chart = PieChartView()
        chart.holeRadiusPercent = 0.80
        chart.drawEntryLabelsEnabled = false
        chart.largeContentTitle = "My Chart"
        chart.usePercentValuesEnabled = true
        chart.translatesAutoresizingMaskIntoConstraints = false
        return chart
    }()
    
    func configureCell(with data: PieChartData) {
        label.text = data.dataSets.first?.label
        data.setValueFormatter(PercentageValueFormatter())
        pieChart.data = data
    }
    
    private func configureLayout() {
        contentView.addSubview(label)
        contentView.addSubview(pieChart)
        let margins = contentView.layoutMarginsGuide
        let padding: CGFloat = 15.0
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            pieChart.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: padding),
            pieChart.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: padding),
            
            label.topAnchor.constraint(equalTo: margins.topAnchor, constant: padding),
            pieChart.topAnchor.constraint(equalTo: label.bottomAnchor, constant: padding),
            pieChart.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: padding)
        ])
    }
}
