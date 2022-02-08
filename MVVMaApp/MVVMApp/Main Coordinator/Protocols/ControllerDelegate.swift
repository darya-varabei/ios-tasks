//
//  ControllerDelegate.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 2/2/22.
//

import Foundation

protocol ControllerDelegate {
    func goToDetailView(flow: AppFlow, cellViewModel: BookCellViewModel?, viewModelObject: BookDetailViewModel?) 
    @discardableResult func resetToRoot(animated: Bool) -> Self
}
