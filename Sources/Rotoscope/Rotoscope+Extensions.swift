//
//  File.swift
//  
//
//  Created by Tomoya Hirano on 2019/10/27.
//

import UIKit

extension Rotoscope {
    public static func addRefreshControlToLastTableView() -> UIRefreshControl? {
        guard let tableView = viewReferences.compactMap({ $0 as? UITableView }).last else { return nil }
        let refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        return refreshControl
    }
}
