
import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
    
    let timeArray = ["1 Min", "60 Min", "1 Min", "60 Min", "1 Min"] // Array for time durations
    let imageArray = ["6", "8", "6", "8", "6"] // Array for background images
       
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ModelTVC", for: indexPath) as! ModelTVC
        
        // Set background image based on index
        cell.imageView?.image = UIImage(named: imageArray[indexPath.row])
        
        // Set time label text based on index
        cell.timeLbl.text = timeArray[indexPath.row % timeArray.count]
        
        if indexPath.row % 2 == 0 {
            // For cells with index number 0, 2, 4
            cell.gratitudeLbl.text = "Gratitude"
            cell.journalLbl.text = "Journal"
        } else {
            // For cells with index number 1, 3, 5
            cell.gratitudeLbl.text = "For Inner Peace"
            cell.journalLbl.text = "Music"
        }
        
        // Set corner radius
        cell.contentView.layer.cornerRadius = 14
        cell.contentView.layer.masksToBounds = true
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Add your cell height along with spacing
        return 140
        // Adjust this value according to your needs
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40 // Add some space between cells
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        footerView.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40) // Adjust height for spacing
        return footerView
    }

    @IBOutlet weak var tableView: UITableView!
    {
        didSet {
            let nibName = UINib(nibName: "ModelTVC", bundle: nil)
            self.tableView.register(nibName, forCellReuseIdentifier: "ModelTVC")
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            let nibName = UINib(nibName: "CollectionViewXibCell", bundle: nil)
            self.collectionView.register(nibName, forCellWithReuseIdentifier: "CollectionViewXibCell")
        }
    }
    
    @IBOutlet weak var topView1: UIView!
    @IBOutlet weak var humanIconIV: UIImageView!
    @IBOutlet weak var topView2: UIView!
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var exploreBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        topView1.layer.cornerRadius = 8
        topView1.layer.borderWidth = 2
        topView1.layer.borderColor = UIColor.systemBlue.cgColor
        
        humanIconIV.layer.cornerRadius = 6
        humanIconIV.layer.borderWidth = 2
        humanIconIV.layer.borderColor = UIColor.systemBlue.cgColor
        
        topView2.layer.cornerRadius = 10
        view2.layer.cornerRadius = 10
        
        exploreBtn.layer.cornerRadius = 6
        exploreBtn.layer.borderWidth = 2
        exploreBtn.layer.borderColor = UIColor.white.cgColor
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self
        //set the values for top,left,bottom,right margins
        let margins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        tableView.frame = tableView.frame.inset(by: margins)
        
        // Hide default separators
        tableView.separatorStyle = .none
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewXibCell", for: indexPath) as! CollectionViewXibCell
        
        if indexPath.item % 2 == 0 {
               // For cells with index number 0, 2, 4
               cell.label1.text = "Day2: Steps to Recharge"
               cell.label2.text = "Meditation"
           } else {
               // For cells with index number 1, 3, 5
               cell.label1.text = "Training"
               cell.label2.text = "Workout"
           }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let meditationController = storyboard.instantiateViewController(withIdentifier: "MeditationController") as? MeditationController {
            // Present the meditationController modally
            self.present(meditationController, animated: true, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 120)
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Retrieve the selected image from the imageArray
        let selectedImage = UIImage(named: imageArray[indexPath.row])
        
        // Retrieve the selected timer value from the timeArray
        let selectedTimerValue = timeArray[indexPath.row]
        
        // Instantiate the GratitudeController from storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let gratitudeController = storyboard.instantiateViewController(withIdentifier: "GratitudeController") as? GratitudeController {
            // Pass the selected image and timer value to GratitudeController
            gratitudeController.selectedImage = selectedImage
            gratitudeController.selectedTimer = selectedTimerValue
            
            // Present the gratitudeController modally or push it to navigation stack based on your navigation flow
            self.navigationController?.pushViewController(gratitudeController, animated: true)
        }
    }


}
    

