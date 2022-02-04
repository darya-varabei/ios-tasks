//
//  CollectionViewDataSource.swift
//  Workouts
//
//  Created by Дарья Воробей on 2/2/22.
//

import Foundation
import CoreData
import UIKit

protocol CollectionViewDataSourceDelegate: class {
    associatedtype Object: NSFetchRequestResult
    associatedtype Cell: UICollectionViewCell
    func configure(_ cell: Cell, for object: Object)
}

fileprivate enum Update<Object> {
    case insert(IndexPath)
    case update(IndexPath, Object)
    case move(IndexPath, IndexPath)
    case delete(IndexPath)
}


class CollectionViewDataSource<Delegate: CollectionViewDataSourceDelegate>: NSObject, UICollectionViewDataSource, NSFetchedResultsControllerDelegate {

    typealias Object = Delegate.Object
    typealias Cell = Delegate.Cell
    
    fileprivate let collectionView: UICollectionView
    fileprivate let cellIdentifier: String
    fileprivate let fetchedResultsController: NSFetchedResultsController<Object>
    fileprivate weak var delegate: Delegate!
    fileprivate var updates: [Update<Object>] = []

    required init(collectionView: UICollectionView, cellIdentifier: String, fetchedResultsController: NSFetchedResultsController<Object>, delegate: Delegate) {
        self.collectionView = collectionView
        self.cellIdentifier = cellIdentifier
        self.fetchedResultsController = fetchedResultsController
        self.delegate = delegate
        super.init()
        fetchedResultsController.delegate = self
        try! fetchedResultsController.performFetch()
        collectionView.dataSource = self
        collectionView.reloadData()
    }

    var selectedObject: Object? {
        guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return nil }
        return objectAtIndexPath(indexPath)
    }

    func objectAtIndexPath(_ indexPath: IndexPath) -> Object {
        return fetchedResultsController.object(at: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = fetchedResultsController.sections?[section] else { return 0 }
        return section.numberOfObjects
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let object = objectAtIndexPath(indexPath)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? Cell else { return UICollectionViewCell() }
        delegate.configure(cell, for: object)
        return cell
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            guard let indexPath = newIndexPath else { return }
            updates.append(.insert(indexPath))
        case .update:
            guard let indexPath = indexPath else { return }
            let object = objectAtIndexPath(indexPath)
            updates.append(.update(indexPath, object))
        case .move:
            guard let indexPath = indexPath else { return }
            guard let newIndexPath = newIndexPath else { return }
            updates.append(.move(indexPath, newIndexPath))
        case .delete:
            guard let indexPath = indexPath else { return }
            updates.append(.delete(indexPath))
        default:
            break
        }
    }
}


