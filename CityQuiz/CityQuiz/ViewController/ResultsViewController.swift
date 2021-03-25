//
//  ResultsViewController.swift
//  CityQuiz
//
//  Created by mac on 25.03.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    // MARK: - Public Properties
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateResult()
        navigationItem.hidesBackButton = true
    }
}

// MARK: - Private Methods
extension ResultsViewController {
    private func updateResult() {
        var frequencyOfCities: [CityType: Int] = [:]
        let cities = responses.map { $0.type }
        print(cities)
        for city in cities {
            frequencyOfCities[city] = (frequencyOfCities[city] ?? 0) + 1
        }
        
        let sortedFrequencyOfCities = frequencyOfCities.sorted { $0.value > $1.value }
        guard let mostFrequencyCity = sortedFrequencyOfCities.first?.key else { return }
        
        updateUI(with: mostFrequencyCity)
    }
    
    private func updateUI(with city: CityType) {
        resultAnswerLabel.text = "Ваш город - \(city.rawValue)!"
        resultDescriptionLabel.text = city.definition
    }
}
