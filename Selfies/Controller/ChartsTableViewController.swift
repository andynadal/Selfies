//
//  ChartsTableViewController.swift
//  Selfies
//
//  Created by Andy Nadal on 8/11/21.
//

import UIKit
import Charts

final class ChartsTableViewController: UITableViewController {
    
    var networkingService = NetworkService()
    var data = [PieChartData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 450.0
        
        navigationItem.title = "Gráficas"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        networkingService.callService { [weak self] response in
            self?.set(data: response)
        }
        
        tableView.register(ChartCell.self, forCellReuseIdentifier: ChartCell.id)
    }
    
    private func set(data: ServiceResponse) {
        // UI Updates must happen in the main thread.
        DispatchQueue.main.async { [weak self] in
            self?.data = data.chartData
            self?.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { data.count }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChartCell.id, for: indexPath) as? ChartCell else { return UITableViewCell() }
        cell.configureCell(with: data[indexPath.row])
        return cell
    }
}
