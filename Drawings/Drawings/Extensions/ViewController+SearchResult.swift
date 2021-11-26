//
//  SearchControllerExtensions.swift
//  Drawings
//
//  Created by Darya on 11/18/21.
//

import Foundation
import UIKit

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        sections = filteredSections(for: searchController.searchBar.text)
        applySnapshot()
    }
    
    func filteredSections(for queryOrNil: String?) -> [Drawing] {
        let sections = Drawing.drawings
        guard let query = queryOrNil, !query.isEmpty else {
            return sections
        }
        
        return sections.filter { section in
            var matches = section.title.lowercased().contains(query.lowercased())
            for video in sections {
                if video.title.lowercased().contains(query.lowercased()) {
                    matches = true
                    break
                }
            }
            return matches
        }
    }
    
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search drawings"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}
