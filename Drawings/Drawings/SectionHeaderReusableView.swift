//
//  SectionHeaderReusableView.swift
//  Drawings
//
//  Created by Darya on 11/18/21.
//

import Foundation
import UIKit

class SectionHeaderReusableView: UICollectionReusableView {
    
  static var reuseIdentifier: String {
    return String(describing: SectionHeaderReusableView.self)
  }
  
  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.adjustsFontForContentSizeCategory = true
    label.textColor = .label
    label.textAlignment = .left
    label.setContentCompressionResistancePriority(
      .defaultHigh, for: .horizontal)
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemBackground
    addSubview(titleLabel)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
