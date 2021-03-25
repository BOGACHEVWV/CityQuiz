//
//  QuestionsViewController.swift
//  CityQuiz
//
//  Created by mac on 25.03.2021.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider!
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    // MARK: - Private Properties
    private var questions = Question.getQuestions()
    private var questionIndex = 0
    private var answersChoosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "resultSegue" else { return }
        let resultsVC = segue.destination as! ResultsViewController
        resultsVC.responses = answersChoosen
    }
    
    // MARK: - IB Actions
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        guard let currentIndex = singleButtons.firstIndex(of: sender) else { return }
        
        let currentAnswer = currentAnswers[currentIndex]
        answersChoosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChoosen.append(answer)
            }
        }
        
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChoosen.append(currentAnswers[index])
        nextQuestion()
    }
}

// MARK: - Private Methods
extension QuestionsViewController {
    
    private func updateUI() {
        // Hide everything
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        // Get current question
        let currentQuestion = questions[questionIndex]
        
        // Set current question for question label
        questionLabel.text = currentQuestion.text
        
        // Calculate progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // Set progress for questionProgressView
        questionProgressView.setProgress(totalProgress, animated: true)
        
        // Set title fo navigation bar
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        // Show stack view corresponding to question type
        switch currentQuestion.type {
        case .single:
            showSingleStackView(with: currentAnswers)
        case .multiple:
            showMultipleStackView(with: currentAnswers)
        case .ranged:
            showRangedStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        // Show single stack view
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        // Show multiple stack view
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    private func showRangedStackView(with answers: [Answer]) {
        // Show ranged stack view
        rangedStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
}

// Show next question or go to the next screen
extension QuestionsViewController {
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
}

