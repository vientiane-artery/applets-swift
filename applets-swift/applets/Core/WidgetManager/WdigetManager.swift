//
//  WdigetManager.swift
//  applets-swift
//
//  Created by Mars Scala on 2020/11/10.
//

import Foundation

class AppletsWidgetManager {
    static let widgetManager : AppletsWidgetManager = {
        let manager = AppletsWidgetManager()
        manager.loadDefaultWidgets()
        return manager
    }()
    
    var widgets = [AppletsWidget]()
    
    init() {
        
    }
    
    private func loadDefaultWidgets() {
        
    }
    
}
