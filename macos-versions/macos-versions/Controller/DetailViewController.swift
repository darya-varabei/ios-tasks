//
//  DetailViewController.swift
//  macos-versions
//
//  Created by Дарья Воробей on 1/4/22.
//

import UIKit

class DetailViewController: UIViewController {
    
   
    @IBOutlet private var versionImage: UIImageView!
    @IBOutlet private var mainVersionLabel: UILabel!
    @IBOutlet private var dateAnnouncedLabel: UILabel!
    @IBOutlet private var dateReleasedLabel: UILabel!
    @IBOutlet private var requirementsTextView: UITextView!
    private var data: Version? {
        didSet {
            //self.versionImage.image = UIImage(named: data?.image ?? "macos-sierra")
            //mainVersionLabel.text = "htsdv"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getData(version: Version) {
        data = version
    }
}
