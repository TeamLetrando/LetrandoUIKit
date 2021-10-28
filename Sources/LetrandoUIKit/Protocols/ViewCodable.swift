//
//  File.swift
//  
//
//  Created by Ronaldo Gomes on 15/10/21.
//

import Foundation

/// A protocol that provides base functions for using view code
public protocol ViewCodable {
    /// Add views to the main view
    func buildViewHierarchy()
    
    /// Add constraints for the view
    func setupConstraints()
    
    /// Add additional necessary settings to the view
    func setupAditionalChanges()
}

public extension ViewCodable {
    /// Call this function from didMoveToSuperview to perform the viewCode functions
    func setupView() {
        self.buildViewHierarchy()
        self.setupConstraints()
        self.setupAditionalChanges()
    }
    
    func setupAditionalChanges() {}
}
