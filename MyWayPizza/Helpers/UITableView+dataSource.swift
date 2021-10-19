//
//  UITableView+dataSource.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 19.10.21.
//

import Foundation

enum DataSourceState<T> {
    case loading
    case populated([T])
    case empty
    case error(Error)

    var currentItems: [T] {
        switch self {
        case .populated(let items): return items
        default: return []
        }
    }
}
