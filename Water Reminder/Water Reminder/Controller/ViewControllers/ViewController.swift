//
//  ViewController.swift
//  Water Reminder
//
//  Created by Darya on 11/9/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var quickOptionsLabel: UILabel!
    @IBOutlet private var buttonUpdateParameters: UIButton!
    @IBOutlet private var buttonOnlyCleanWater: UIButton!
    @IBOutlet private var textFieldWaterToAdd: UITextField!
    @IBOutlet private var buttonAddWater: UIButton!
    private let options = OptionCollection()
    private var consumption = Consumption()
    private let defaultImage = "arrowshape.turn.up.backward"
    private let labelTextSize: CGFloat = 42
    
    private enum ButtonTitle: String {
        case allBeverages = "All beverages"
        case onlyCleanWater = "Only clean water"
    }
    
    private enum CellIdentifier: String {
        case optionViewCell = "OptionViewCell"
        case collectionViewCell = "CollectionViewCell"
        case cancelCell = "cancelCell"
    }
    
    private enum Constraint: CGFloat {
        case collectionInstets = 28
        case collectionBottom = 20
        case collectionLeading = 10
        case waveInset = 80
        case borderInset = 85
        case heightMultiplier = 3
        case widthMultiplier = 2
        case borderStepper = 35
        case waveStepper = 30
    }
    
    private enum WaveParameters: Int {
        case size = 160
        case borderSize = 170
        case cornerRadius = 80
        case borderRadius = 85
        case borderOffset = 35
        case waveOffset = 0
    }
    
    private var labelPercentCompleted: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: CustomColor.buttonBlueOpaque.rawValue)
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
        setupKeyboard()
        displayAnimatedWater()
        setupButtons()
        consumption.initUser()
        setupPercentageLabel()
        setupCollection()
        UserDefaults.lastAccessDate = Date()
        consumption.fetchUserStoredData()
        setupPercentageLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupCollection()
        updateProgress()
        wave?.startAnimation()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        wave?.stopAnimation()
    }
    
    private func setupPercentageLabel() {
        wave?.addSubview(labelPercentCompleted)
        labelPercentCompleted.font = UIFont(name: "Futura-Medium", size: labelTextSize)
        labelPercentCompleted.textColor = UIColor(named: CustomColor.buttonBlueOpaque.rawValue)
        labelPercentCompleted.centerYAnchor.constraint(equalTo: wave?.centerYAnchor ?? NSLayoutYAxisAnchor(), constant: 0).isActive = true
        labelPercentCompleted.centerXAnchor.constraint(equalTo: wave?.centerXAnchor ?? NSLayoutXAxisAnchor(), constant: 0).isActive = true
    }
    
    private func setupKeyboard() {
        hideKeyboardWhenTappedAround()
        let bar = UIToolbar()
        textFieldWaterToAdd.inputAccessoryView = bar.hideKeyboardToolbar()
        textFieldWaterToAdd.keyboardType = .decimalPad
    }
    
    private func setupButtons() {
        buttonUpdateParameters.layer.cornerRadius = CGFloat(ControllerParameters.controllerRadius.rawValue)
        buttonOnlyCleanWater.layer.cornerRadius = CGFloat(ControllerParameters.controllerRadius.rawValue)
        buttonAddWater.layer.cornerRadius = CGFloat(ControllerParameters.controllerRadius.rawValue)
    }
    
    private func setupCollection() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: Constraint.collectionInstets.rawValue, bottom: 0, right: Constraint.collectionInstets.rawValue)
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constraint.collectionBottom.rawValue).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraint.collectionLeading.rawValue).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0).isActive = true
        collectionView.topAnchor.constraint(equalTo: quickOptionsLabel.bottomAnchor, constant: Constraint.collectionLeading.rawValue).isActive = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func displayAnimatedWater() {
        let maskView = UIView(frame: CGRect(x: 0, y: 0, width: WaveParameters.size.rawValue, height: WaveParameters.size.rawValue))
        maskView.backgroundColor = .red
        maskView.layer.cornerRadius = CGFloat(WaveParameters.cornerRadius.rawValue)
        
        let borderView = UIView(frame: CGRect(x: UIScreen.main.bounds.width / Constraint.widthMultiplier.rawValue - Constraint.borderInset.rawValue, y: UIScreen.main.bounds.height / Constraint.heightMultiplier.rawValue - Constraint.borderStepper.rawValue, width: CGFloat(WaveParameters.borderSize.rawValue), height: CGFloat(WaveParameters.borderSize.rawValue)))
        borderView.layer.cornerRadius = CGFloat(WaveParameters.borderRadius.rawValue)
        borderView.layer.borderWidth = 2
        borderView.layer.borderColor = UIColor(named:  CustomColor.waveFront.rawValue)?.cgColor
        view.addSubview(borderView)
        
        wave = WaveAnimationView(frame: CGRect(x: Int(UIScreen.main.bounds.width / Constraint.widthMultiplier.rawValue - Constraint.waveInset.rawValue), y: Int(UIScreen.main.bounds.height / Constraint.heightMultiplier.rawValue) - Int(Constraint.waveStepper.rawValue), width: WaveParameters.size.rawValue, height: WaveParameters.size.rawValue))
        wave?.setProgress(Float(consumption.totalTodayPercent()))
        options.fillOptions()
        view.addSubview(wave ?? view)
        wave?.mask = maskView
    }
    
    private func updateProgress() {
        
        var percent: Double = 0.0
        
        if buttonOnlyCleanWater.tag == 1 {
            percent = consumption.totalTodayPercent()
        }
        else {
            percent = consumption.totalTodayClearPercent()
        }
        
        if !percent.isNaN && !percent.isInfinite{
            wave?.setProgress(Float(percent))
            labelPercentCompleted.text = "\(min(Int(round(percent * Double(ControllerParameters.percentMultiplier.rawValue))) / ControllerParameters.toRound.rawValue, ControllerParameters.maxDisplayedWaterPercent.rawValue))%"
        }
    }
    
    private func removeLast() {
        consumption.removeLast()
        let percent = Double(consumption.totalTodayPercent())
        wave?.setProgress(Float(percent))
        labelPercentCompleted.text = "\(min(Int(round(percent * Double(ControllerParameters.percentMultiplier.rawValue))) / ControllerParameters.toRound.rawValue, ControllerParameters.maxDisplayedWaterPercent.rawValue))%"
    }
    
    @IBAction private func measureOnlyCleanWater(_ sender: Any) {
        
        if buttonOnlyCleanWater.tag == 1 {
            buttonOnlyCleanWater.tag = 2
            buttonOnlyCleanWater.setTitle(ButtonTitle.allBeverages.rawValue, for: .normal)
        }
        else {
            buttonOnlyCleanWater.tag = 1
            buttonOnlyCleanWater.setTitle(ButtonTitle.onlyCleanWater.rawValue, for: .normal)
        }
        updateProgress()
    }
    
    @IBAction private func addWater(_ sender: Any) {
        options.addCustomOption(volume: Double(textFieldWaterToAdd?.text?.toDouble() ?? 0.0))
        consumption.addRecentItems(item: options.quickOptions[options.quickOptions.endIndex - 1])
        updateProgress()
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
            cell.image = defaultImage
            cell.layer.shadowRadius = CGFloat(CollectionConstants.cellShadowRadius)
            cell.layer.cornerRadius = CGFloat(CollectionConstants.cellCornerRadius)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath != IndexPath(row: 0, section: 0) {
            let addedAmount = options.quickOptions[indexPath.item - 1].volume
            let totalVolume = consumption.getTotal() + addedAmount
            UserDefaults.standard.setValue(totalVolume, forKey: UserParameters.todayTotal.rawValue)
            
            if options.quickOptions[indexPath.item - 1].isClearWater {
                let clearVolume = consumption.getClear() + addedAmount
                UserDefaults.standard.setValue(clearVolume, forKey: UserParameters.todayClear.rawValue)
            }
            consumption.addRecentItems(item: options.quickOptions[indexPath.item - 1])
            updateProgress()
        }
        else {
            removeLast()
        }
    }
}
