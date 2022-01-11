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
    private let defaultImage = "arrowshape.turn.up.backward"
    private let labelTextSize: CGFloat = 42
    
    private enum ButtonTitle {
        static let allBeverages = "All beverages"
        static let onlyCleanWater = "Only clean water"
    }
    
    private enum CellIdentifier {
        static let optionViewCell = "OptionViewCell"
        static let collectionViewCell = "CollectionViewCell"
        static let cancelCell = "cancelCell"
    }
    
    private enum Constraint {
        static let collectionInstets: CGFloat = 28
        static let collectionBottom: CGFloat = 20
        static let collectionLeading: CGFloat = 10
        static let waveInset: CGFloat = 80
        static let borderInset: CGFloat = 85
        static let heightMultiplier: CGFloat = 3
        static let widthMultiplier: CGFloat = 2
        static let borderStepper: CGFloat = 35
        static let waveStepper = 30
    }
    
    private enum WaveParameters {
        static let size = 160
        static let borderSize: CGFloat = 170
        static let cornerRadius: CGFloat = 80
        static let borderRadius: CGFloat = 85
        static let borderOffset = 35
        static let waveOffset = 0
    }
    
    private var labelPercentCompleted: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: CustomColor.buttonBlueOpaque.rawValue)
        label.textAlignment = .left
        return label
    }()
    
    private var consumption = Consumption()
    private var wave: WaveAnimationView?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UINib(nibName: CellIdentifier.optionViewCell, bundle: nil), forCellWithReuseIdentifier: CellIdentifier.optionViewCell)
        collectionView.register(UINib(nibName: CellIdentifier.collectionViewCell, bundle: nil), forCellWithReuseIdentifier: CellIdentifier.cancelCell)
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
        buttonUpdateParameters.layer.cornerRadius = ControllerParameters.controllerRadius
        buttonOnlyCleanWater.layer.cornerRadius = ControllerParameters.controllerRadius
        buttonAddWater.layer.cornerRadius = ControllerParameters.controllerRadius
    }
    
    private func setupCollection() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: Constraint.collectionInstets, bottom: 0, right: Constraint.collectionInstets)
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constraint.collectionBottom).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraint.collectionLeading).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0).isActive = true
        collectionView.topAnchor.constraint(equalTo: quickOptionsLabel.bottomAnchor, constant: Constraint.collectionLeading).isActive = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func displayAnimatedWater() {
        let maskView = UIView(frame: CGRect(x: 0, y: 0, width: WaveParameters.size, height: WaveParameters.size))
        maskView.backgroundColor = .red
        maskView.layer.cornerRadius = WaveParameters.cornerRadius
        
        let borderView = UIView(frame: CGRect(x: UIScreen.main.bounds.width / Constraint.widthMultiplier - Constraint.borderInset, y: UIScreen.main.bounds.height / Constraint.heightMultiplier - Constraint.borderStepper, width: WaveParameters.borderSize, height: WaveParameters.borderSize))
        borderView.layer.cornerRadius = WaveParameters.borderRadius
        borderView.layer.borderWidth = 2
        borderView.layer.borderColor = UIColor(named:  CustomColor.waveFront.rawValue)?.cgColor
        view.addSubview(borderView)
        
        wave = WaveAnimationView(frame: CGRect(x: Int(UIScreen.main.bounds.width / Constraint.widthMultiplier - Constraint.waveInset), y: Int(UIScreen.main.bounds.height / Constraint.heightMultiplier) - Constraint.waveStepper, width: WaveParameters.size, height: WaveParameters.size))
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
        
        if !percent.isNaN && !percent.isInfinite {
            wave?.setProgress(Float(percent))
            labelPercentCompleted.text = "\(min(CGFloat(round(percent * Double(ControllerParameters.percentMultiplier))) / ControllerParameters.toRound, ControllerParameters.maxDisplayedWaterPercent))%"
        }
    }
    
    private func removeLast() {
        consumption.removeLast()
        let percent = consumption.totalTodayPercent()
        wave?.setProgress(Float(percent))
        labelPercentCompleted.text = "\(min(CGFloat(round(percent * Double(ControllerParameters.percentMultiplier))) / ControllerParameters.toRound, ControllerParameters.maxDisplayedWaterPercent))%"
    }
    
    @IBAction private func measureOnlyCleanWater(_ sender: Any) {
        
        if buttonOnlyCleanWater.tag == 1 {
            buttonOnlyCleanWater.tag = 2
            buttonOnlyCleanWater.setTitle(ButtonTitle.allBeverages, for: .normal)
        }
        else {
            buttonOnlyCleanWater.tag = 1
            buttonOnlyCleanWater.setTitle(ButtonTitle.onlyCleanWater, for: .normal)
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) ->  CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.quickOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath != IndexPath(row: 0, section: 0) {
            
            guard let cell: OptionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.optionViewCell, for: indexPath) as? OptionViewCell) else { return OptionViewCell() }
            cell.name = options.quickOptions[indexPath.item - 1].name
            cell.volume = options.quickOptions[indexPath.item - 1].volume
            cell.image = options.quickOptions[indexPath.item - 1].image
            return cell
        }
        
        else {
            guard let cell: CollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.cancelCell, for: indexPath) as? CollectionViewCell) else { return CollectionViewCell() }
            cell.image = defaultImage
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
