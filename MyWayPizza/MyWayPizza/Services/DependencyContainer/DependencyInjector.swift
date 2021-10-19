//
//  DependencyInjector.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 19.10.21.
//

// NOTE: Our Dependency Injection pattern is inspired by
// http://basememara.com/swift-protocol-oriented-dependency-injection/

import UIKit

/// The singleton dependency container reference
/// which can be reassigned to another container
struct DependencyInjector {
    static var dependencies: Dependency = CoreDependency()
    private init() { }
}

/// Attach to any type for exposing the dependency container
protocol HasDependencies {
    var dependencies: Dependency { get }
}

extension HasDependencies {
    /// container for dependency instance factories
    var dependencies: Dependency {
        return DependencyInjector.dependencies
    }
}

extension UIApplicationDelegate {
    func configure(dependency: Dependency) {
        DependencyInjector.dependencies = dependency
    }
}
