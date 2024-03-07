//
//  MeditationController.swift
//  TASK
//
//  Created by Komal  on 07/03/24.
//

import UIKit

class MeditationController: UIViewController {
    
    @IBOutlet weak var timerLbl: UILabel!
    
    var timer: Timer?
    var totalTime = 10 * 60 // 10 minutes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
        
        // Add custom back button
        let backButton = UIButton(type: .system)
        backButton.setTitle("Back", for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 24) // Adjust font size
        backButton.setTitleColor(.yellow, for: .normal) // Set title color to yellow
        
        // Create a template rendering mode back arrow image
        let backImage = UIImage(systemName: "chevron.left")?.withRenderingMode(.alwaysTemplate)
        
        // Set the template back arrow image to the button
        backButton.setImage(backImage, for: .normal)
        backButton.tintColor = .yellow // Set the tint color to yellow
        
        backButton.imageView?.contentMode = .scaleAspectFit
        
        backButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0) // Adjust image position
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        self.view.addSubview(backButton)
        
        // Add constraints to position the button
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
    }
    
    @objc func backButtonTapped() {
        // Handle back button tap
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil) // If not embedded in navigation controller, dismiss it
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if totalTime > 0 {
            totalTime -= 1
            updateUI()
        } else {
            timer?.invalidate()
            showAlert()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Goal Achieved", message: "Your goal is achieved. Would you like to continue?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
            // Handle "Yes" action (e.g., start the timer again)
            self.totalTime = 10 * 60 // Reset the timer
            self.startTimer() // Start the timer again
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateUI() {
        let minutes = totalTime / 60
        let seconds = totalTime % 60
        timerLbl.text = String(format: "%02d:%02d", minutes, seconds)
        
        // Customize label properties here
        timerLbl.textColor = .yellow
        timerLbl.font = UIFont.systemFont(ofSize: 50)
        // Add more customization as needed
    }
    
    
    func timerDidFinish() {
        // Perform any actions you need to when the timer finishes
        print("Timer finished!")
    }
    
    
    
}
