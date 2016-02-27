//
//  ConfirmViewController.swift
//  Handshake
//
//  Created by Marion Xu on 2/27/16.
//  Copyright © 2016 TintPoint. All rights reserved.
//

import UIKit
import AFNetworking
import CoreData

class ConfirmViewController: UIViewController {

    var person: Person?
    var context: NSManagedObjectContext?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    //TODO: change these to nice pics of check mark and x if we have time
    //and put them on the same line :)

    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let firstName = person?.firstName, let lastName = person?.lastName {
            titleLabel.text = "You just shook hands with \(firstName) \(lastName)!"
        }

        // TODO: replace this url with the profile pic link for the other user. :)
    }
    
    @IBAction func confirmButtonClicked(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelButtonClicked(sender: AnyObject) {

        do {
            if let unwrappedPerson = self.person {
                self.context?.deleteObject(unwrappedPerson)
                try self.context?.save()
            }
        } catch let error as NSError {
            print("Unable to delete person: \(error.localizedDescription)")
        }

        dismissViewControllerAnimated(true, completion: nil)
    }
}
