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
    
    private let defaultImage = "macos-sierra"
   
    private var data: Version? {
        didSet {
            versionImage.image = UIImage(named: data?.image ?? defaultImage)
            dateAnnouncedLabel.text = data?.announced
            dateReleasedLabel.text = data?.released
            requirementsTextView.text = formRequerementsTextView()
            mainVersionLabel.text = configureVersionLabel()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        requirementsTextView.sizeToFit()
    }
    
    func getData(version: Version) {
        data = version
    }
    
    private func configureVersionLabel() -> String {
        
        guard let family = data?.family.rawValue, let version = data?.version, let codename = data?.codename else { return "" }
        return [family, version, codename].joined(separator: " ")
    }
    
    private func formRequerementsTextView() -> String {
        let requirements = data?.requirements.joined(separator: "\n") ?? ""
        return requirements
    }
}
