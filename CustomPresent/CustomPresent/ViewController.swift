//
//  ViewController.swift
//  CustomPresent
//
//  Created by Don Mag on 5/2/18.
//  Copyright © 2018 DonMag. All rights reserved.
//

import UIKit

class VenueDetailsVC: UIViewController {
	
	@IBAction func dismissTapped(_ sender: Any) {
		dismissDetail()
	}
	
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet var theTableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		theTableView.delegate = self
		theTableView.dataSource = self
	}
	
	// MARK: - Table view data source
	
	func numberOfSections(in tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "CPCell", for: indexPath)
		
		// Configure the cell...
		cell.textLabel?.text = "\(indexPath)"
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		guard let venueDetailsVC = storyboard?.instantiateViewController(withIdentifier: "VenueDetailsVC") as? VenueDetailsVC else { return }  //create an instance of VenueDetailsVC
		
		presentDetail(venueDetailsVC)//present Group Feed VC using custom extension
		
	}
	
}

extension UIViewController {
	
	//present VC fromRight
	func presentDetail(_ viewControllerToPresent: UIViewController){
		//constant to hold animation
		let transition = CATransition()
		
		transition.duration =  0.3 //seconds
		transition.type = kCATransitionPush
		transition.subtype = kCATransitionFromRight
		self.view.window?.layer.add(transition, forKey: kCATransition)
		
		present(viewControllerToPresent, animated: false, completion: nil)
		
	}//end func
	
	//dismiss VC fromLeft
	func dismissDetail(){
		//constant to hold animation
		let transition = CATransition()
		
		transition.duration =  0.3 //seconds
		transition.type = kCATransitionPush
		transition.subtype = kCATransitionFromLeft
		self.view.window?.layer.add(transition, forKey: kCATransition)
		
		dismiss(animated: false, completion: nil)
	}//end func
}

