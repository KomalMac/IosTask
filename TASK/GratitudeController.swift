//
//  GratitudeController.swift
//  TASK
//
//  Created by Komal  on 07/03/24.
//

import UIKit

class GratitudeController: UIViewController {
    
    var selectedImage: UIImage? // Property to hold the selected image
    var selectedTimer: String?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var timerLbl: UILabel!
    
    var timer: Timer?
    var totalTime = 60 // This sets the initial time to 1 minute (60 seconds)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check if selectedImage is not nil
        if let image = selectedImage {
            // Set the selected image to the imageView
            imageView.image = image
        }
        
        // Convert the selectedTimer string to an integer
        if let timerString = selectedTimer {
            // Parse the timer string to extract minutes
        if let minutes = parseMinutes(from: timerString) {
            totalTime = minutes * 60 // Convert minutes to seconds
            }
        }
            
        // Update UI with initial timer value
        updateUI()
           
        startTimer()
    }
    
    // Function to parse minutes from the timer string
    func parseMinutes(from timerString: String) -> Int? {
        // Split the timer string by space
        let components = timerString.components(separatedBy: " ")
        if components.count == 2 {
            // Extract the first component and convert it to an integer
            if let minutes = Int(components[0]) {
                return minutes
            }
        }
        return nil
    }
    
    
    func updateUI() {
        let minutes = totalTime / 60
        let seconds = totalTime % 60
        timerLbl.text = String(format: "%02d:%02d", minutes, seconds)
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
        
        let yesAction = UIAlertAction(title: "Yes", style: .default) { _ in
            // Handle "Yes" action by resetting the timer to the value from selectedTimer and starting it again
            if let selectedTimer = self.selectedTimer, let minutes = self.parseMinutes(from: selectedTimer) {
                self.totalTime = minutes * 60 // Convert minutes to seconds
                self.startTimer() // Start the timer again
            }
        }
        
        let noAction = UIAlertAction(title: "No", style: .cancel) { _ in
            // Handle "No" action by going back to the previous screen
            self.navigationController?.popViewController(animated: true)
        }
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
//    func updateUI() {
//        let minutes = totalTime / 60
//        let seconds = totalTime % 60
//        timerLbl.text = String(format: "%02d:%02d", minutes, seconds)
//        
//        // Customize label properties here
//        timerLbl.textColor = .blue
//        timerLbl.font = UIFont.systemFont(ofSize: 50)
//        // Add more customization as needed
//    }
    
    
    func timerDidFinish() {
        // Perform any actions you need to when the timer finishes
        print("Timer finished!")
    }
}
