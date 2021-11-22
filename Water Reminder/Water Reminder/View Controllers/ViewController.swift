//
//  ViewController.swift
//  Water Reminder
//
//  Created by Darya on 11/9/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var quickOptionsLabel: UILabel!
    @IBOutlet private var btnUpdateParameters: UIButton!
    @IBOutlet private var btnOnlyCleanWater: UIButton!
    @IBOutlet private var txtWaterToAdd: UITextField!
    @IBOutlet private var btnAddWater: UIButton!
    private let options = OptionsViewModel()
    private var consumption = Consumption()
    
    private var lblPercentCompleted: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: CustomColor.blueButtonOpaque.rawValue)
        label.font = UIFont(name: "Futura-Medium", size: 56)
        label.textAlignment = .left
        return label
    }()
    
    private var wave: WaveAnimationView?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UINib(nibName: CellIdentifier.optionViewCell.rawValue, bundle: nil), forCellWithReuseIdentifier: CellIdentifier.optionViewCell.rawValue)
        collectionView.register(UINib(nibName: CellIdentifier.collectionViewCell.rawValue, bundle: nil), forCellWithReuseIdentifier: CellIdentifier.cancelCell.rawValue)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayAnimatedWater()
        btnUpdateParameters.layer.cornerRadius = 15
        btnOnlyCleanWater.layer.cornerRadius = 15
        btnAddWater.layer.cornerRadius = 15
        
        wave?.startAnimation()
        consumption.initUser()
        setupPercentageLabel()
        setupCollection()
        UserDefaults.lastAccessDate = Date()
        consumption.fetchUserStoredData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.registProgress()
        wave?.startAnimation()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        wave?.stopAnimation()
    }
    
    private func setupPercentageLabel() {
        wave?.addSubview(lblPercentCompleted)
        lblPercentCompleted.textColor = UIColor(named: CustomColor.buttonBlue.rawValue)
        lblPercentCompleted.centerYAnchor.constraint(equalTo: wave?.centerYAnchor ?? NSLayoutYAxisAnchor(), constant: 0).isActive = true
        lblPercentCompleted.centerXAnchor.constraint(equalTo: wave?.centerXAnchor ?? NSLayoutXAxisAnchor(), constant: 0).isActive = true
    }
    
    private func setupCollection() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 28)
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0).isActive = true
        collectionView.topAnchor.constraint(equalTo: quickOptionsLabel.bottomAnchor, constant: 10).isActive = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func displayAnimatedWater() {
        let maskView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        maskView.backgroundColor = .red
        maskView.layer.cornerRadius = 100
        
        let borderView = UIView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 105, y: UIScreen.main.bounds.height / 3 - 55, width: 210, height: 210))
        borderView.layer.cornerRadius = 105
        borderView.layer.borderWidth = 2
        borderView.layer.borderColor = UIColor(named:  CustomColor.waveFront.rawValue)?.cgColor
        view.addSubview(borderView)
        
        wave = WaveAnimationView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 100, y: UIScreen.main.bounds.height / 3 - 50, width: 200, height: 200))
        wave?.setProgress(Float(consumption.totalTodayPercent()))
        options.fillOptions()
        view.addSubview(wave ?? view)
        wave?.mask = maskView
    }
    
    private func registProgress() {
        
        var percent: Float = 0.0
        if btnOnlyCleanWater.tag == 1 {
            percent = Float(consumption.totalTodayPercent())
        }
        else {
            percent = Float(consumption.totalTodayClearPercent())
        }
        wave?.setProgress(percent)
        lblPercentCompleted.text = "\(round(percent * 1000)/10)%"
    }
    
    private func removeLast() {
        consumption.removeLast()
        let percent = Float(consumption.totalTodayPercent())
        wave?.setProgress(percent)
        lblPercentCompleted.text = "\(round(percent * 1000)/10)%"
    }
    
    @IBAction private func measureOnlyCleanWater(_ sender: Any) {
        
        if btnOnlyCleanWater.tag == 1 {
            btnOnlyCleanWater.tag = 2
            btnOnlyCleanWater.setTitle(ButtonTitle.allBeverages.rawValue, for: .normal)
        }
        else {
            btnOnlyCleanWater.tag = 1
            btnOnlyCleanWater.setTitle(ButtonTitle.onlyCleanWater.rawValue, for: .normal)
        }
        registProgress()
    }
    
    @IBAction private func addWater(_ sender: Any) {
        options.addCustomOption(volume: Double(txtWaterToAdd?.text?.toDouble() ?? 0.0))
        consumption.addRecentItems(item: options.quickOptions[options.quickOptions.endIndex - 1])
        registProgress()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    enum CollectionConstants {
        static let numberOfItems = 12
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
            
            let cell: OptionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.optionViewCell.rawValue, for: indexPath) as? OptionViewCell)!
            cell.name = options.quickOptions[indexPath.item - 1].name
            cell.volume = "\(options.quickOptions[indexPath.item - 1].volume) ml"
            cell.image = options.quickOptions[indexPath.item - 1].image
            cell.layer.shadowRadius = CGFloat(CollectionConstants.cellShadowRadius)
            cell.layer.cornerRadius = CGFloat(CollectionConstants.cellCornerRadius)
            return cell
        }
        
        else {
            let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.cancelCell.rawValue, for: indexPath) as! CollectionViewCell
            cell.image = "arrowshape.turn.up.backward"
            cell.layer.shadowRadius = CGFloat(CollectionConstants.cellShadowRadius)
            cell.layer.cornerRadius = CGFloat(CollectionConstants.cellCornerRadius)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath != IndexPath(row: 0, section: 0) {
            let addedAmount = options.quickOptions[indexPath.item - 1].volume
            let totalVolume = self.consumption.getTotal() + addedAmount
            UserDefaults.standard.setValue(totalVolume, forKey: UserParameters.todayTotal.rawValue)
            if options.quickOptions[indexPath.item - 1].isClearWater {
                let clearVolume = self.consumption.getClear() + addedAmount
                UserDefaults.standard.setValue(clearVolume, forKey: UserParameters.todayClear.rawValue)
            }
            self.consumption.addRecentItems(item: options.quickOptions[indexPath.item - 1])
            self.registProgress()
        }
        else {
            self.removeLast()
        }
    }
}
