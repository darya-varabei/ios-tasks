//
//  ViewController+UITableView.swift
//  TableViewApp
//
//  Created by Darya on 12/21/21.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if namesArray.count == 0 {
            familyTableView.setEmptyMessage(emptyTableMessage: emptyTableMessage)
        }
        else {
            familyTableView.restore()
        }
        return namesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed(tableCellIdentifier, owner: self, options: nil)?.first as? TableViewCell
        cell?.name = namesArray[indexPath.row]
        return cell ?? TableViewCell()
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            familyTableView.beginUpdates()
            familyTableView.deleteRows(at: [indexPath], with: .fade)
            namesArray.remove(at: indexPath.row)
            familyTableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let animation = makeMoveUpWithBounce(rowHeight: cell.frame.height, duration: AnimationParameters.duration, delayFactor: AnimationParameters.delayFactor)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
}
