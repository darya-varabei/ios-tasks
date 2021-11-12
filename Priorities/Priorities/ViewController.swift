//
//  ViewController.swift
//  Priorities
//
//  Created by Darya on 11/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.addArrangedSubview(self.header)
        stackView.addArrangedSubview(self.infoView)
        stackView.addArrangedSubview(self.ticketView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var header = CountryHeaderView()
    let infoView = CountryInfoView()
    let ticketView = TicketsInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.header = CountryHeaderView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
        self.view.addSubview(self.header)
        
    }
    
    override func loadView() {
//        let view = UIView()
//                view.backgroundColor = .red
//                self.view = view
    //  self.header = CountryHeaderView(frame: CGRect(x: 50, y: 50, width: 100, height: 80))
    }
}

