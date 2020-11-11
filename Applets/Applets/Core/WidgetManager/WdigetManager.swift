//
//  WdigetManager.swift
//  applets
//
//  Created by Mars Scala on 2020/11/10.
//

import Foundation

class AppletsWidgetManager {

    static let widgetManager = AppletsWidgetManager()
    var widgets = [AppletsWidget]()

    init() {
        loadDefaultWidgets()
    }

    private func loadDefaultWidgets() {}
}
