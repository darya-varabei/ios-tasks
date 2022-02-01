//
//  ControllerDelegate.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 2/2/22.
//

import Foundation

protocol ControllerDelegate {
    func goToDetailView(flow: AppFlow, cellViewModel: BookCellViewModel?, viewModelObject: ViewModelGetObject?)
    @discardableResult func resetToRoot(animated: Bool) -> Self
}
