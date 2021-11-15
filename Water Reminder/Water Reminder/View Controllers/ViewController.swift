//
//  ViewController.swift
//  Water Reminder
//
//  Created by Darya on 11/9/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var quickOptionsLabel: UILabel!
    @IBOutlet weak var btnUpdateParameters: UIButton!
    @IBOutlet weak var btnOnlyCleanWater: UIButton!
    private let options = OptionsViewModel()
    private let consumption = Consumption()
    
    private var lblPercentCompleted: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "blueButtonOpaque")
        label.font = UIFont(name: "Futura-Medium", size: 56)
        label.textAlignment = .left
        return label
    }()
    
    var wave: WaveAnimationView?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UINib(nibName: "OptionViewCell", bundle: nil), forCellWithReuseIdentifier: "OptionViewCell")
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cancelCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayAnimatedWater()
        self.btnUpdateParameters.layer.cornerRadius = 15
        self.btnOnlyCleanWater.layer.cornerRadius = 15
        wave?.startAnimation()
        self.setupPercentageLabel()
        setupCollection()
        UserDefaults.lastAccessDate = Date()
        self.fetchUserStoredData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.registProgress()
        wave?.startAnimation()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        wave?.stopAnimation()
    }
    
    private func setupPercentageLabel() {
        self.wave?.addSubview(lblPercentCompleted)
        self.lblPercentCompleted.textColor = UIColor(named: "buttonBlueOpaque")
        self.lblPercentCompleted.centerYAnchor.constraint(equalTo: self.wave!.centerYAnchor, constant: 0).isActive = true
        self.lblPercentCompleted.centerXAnchor.constraint(equalTo: self.wave!.centerXAnchor, constant: 0).isActive = true
    }
    
    func setupCollection() {
        self.view.addSubview(collectionView)
        self.collectionView.backgroundColor = .white
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 28)
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.quickOptionsLabel.bottomAnchor, constant: 10).isActive = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func displayAnimatedWater() {
        let maskView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        maskView.backgroundColor = .red
        maskView.layer.cornerRadius = 100
        
        let borderView = UIView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 105, y: UIScreen.main.bounds.height / 3 - 55, width: 210, height: 210))
        borderView.layer.cornerRadius = 105
        borderView.layer.borderWidth = 2
        borderView.layer.borderColor = UIColor(named: "WaveFront")?.cgColor
        self.view.addSubview(borderView)
        
        self.wave = WaveAnimationView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 100, y: UIScreen.main.bounds.height / 3 - 50, width: 200, height: 200))
        self.wave?.setProgress(Float(consumption.totalTodayPercent()))
        options.fillOptions()
        view.addSubview(self.wave ?? self.view)
        self.wave?.mask = maskView
    }
    
    private func registProgress() {
        
        if self.btnOnlyCleanWater.tag == 1 {
            let percent = Float(consumption.totalTodayPercent())
            self.wave?.setProgress(percent)
            self.lblPercentCompleted.text = "\(round(percent * 1000)/10)%"
        }
        else {
            let percent = Float(consumption.totalTodayClearPercent())
            self.wave?.setProgress(percent)
            self.lblPercentCompleted.text = "\(round(percent * 1000)/10)%"
        }
    }
    
    private func removeLast() {
        let percent = Float(consumption.totalTodayPercent())
        self.wave?.setProgress(percent)
        self.lblPercentCompleted.text = "\(round(percent * 1000)/10)%"
    }
    
    @IBAction func measureOnlyCleanWater(_ sender: Any) {
    }
    
    private func fetchUserStoredData() {
        self.consumption.totalToday = Int(UserDefaults.standard.double(forKey: "todayTotal"))
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    enum CollectionConstants {
        static let numberOfItems = 11
        static let cellCornerRadius = 12
        static let cellShadowRadius = 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) ->  CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CollectionConstants.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath != IndexPath(row: 0, section: 0) {
            
            let cell: OptionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "OptionViewCell", for: indexPath) as? OptionViewCell)!
            cell.name = options.quickOptions[indexPath.item - 1].name
            cell.volume = "\(options.quickOptions[indexPath.item - 1].volume) ml"
            cell.image = options.quickOptions[indexPath.item - 1].image
            cell.layer.shadowRadius = CGFloat(CollectionConstants.cellShadowRadius)
            cell.layer.cornerRadius = CGFloat(CollectionConstants.cellCornerRadius)
            return cell
        }
        
        else {
            let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cancelCell", for: indexPath) as! CollectionViewCell
            cell.image = "arrowshape.turn.up.backward"
            cell.layer.shadowRadius = CGFloat(CollectionConstants.cellShadowRadius)
            cell.layer.cornerRadius = CGFloat(CollectionConstants.cellCornerRadius)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath != IndexPath(row: 0, section: 0) {
            let addedAmount = options.quickOptions[indexPath.item].volume
            let totalVolume = self.consumption.totalToday + addedAmount
            UserDefaults.standard.setValue(totalVolume, forKey: "todayTotal")
            self.consumption.addRecentItems(item: options.quickOptions[indexPath.item])
            self.registProgress()
        }
        else {
            self.removeLast()
        }
    }
}
