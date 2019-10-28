//
//  File.swift
//  
//
//  Created by Tomoya Hirano on 2019/10/27.
//

import UIKit

extension Rotoscope {
    public static var lastTableView: UITableView? {
        tableViewReferences.compactMap({ $0 }).last
    }
}
