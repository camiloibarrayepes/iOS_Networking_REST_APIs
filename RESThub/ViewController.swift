//
//  ViewController.swift
//  RESThub
//
//  Created by Harrison on 7/25/19.
//  Copyright © 2019 Harrison. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var feedTableView: UITableView!
    
    // MARK: Variables
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //call the class 
        /*DataService.shared.fetchGists { (result) in
            switch result {
                case .success(let gists):
                    for gist in gists {
                        print("\(gist)\n")
                }
                case .failure(let error):
                    print(error)
            }
        }*/
        
        DataService.shared.starUnstarGist(id: "6392e751a30c9841c87f293886552562", star: false) { (success) in
            if success {
                print("Gist successfully Unstarred")
            }else{
                print("Gist Failed")
            }
        }
    }

    @IBAction func createNewGist(_ sender: UIButton) {
        // TODO: POST a new gist
        DataService.shared.createNewGist { (result) in
            switch result {
                case .success(let json):
                    print(json)
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    // MARK: Utilities
    func showResultAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

// MARK: UITableView Delegate & DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCellID", for: indexPath)
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let starAction = UIContextualAction(style: .normal, title: "Star") { (action, view, completion) in
            
            // TODO: PUT a gist star
            completion(true)
        }
        
        let unstarAction = UIContextualAction(style: .normal, title: "Unstar") { (action, view, completion) in
            
            // TODO: DELETE a gist star
            completion(true)
        }
        
        starAction.backgroundColor = .blue
        unstarAction.backgroundColor = .darkGray
        
        let actionConfig = UISwipeActionsConfiguration(actions: [unstarAction, starAction])
        return actionConfig
    }
    
}

