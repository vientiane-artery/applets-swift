//
//  AppletModuleWebView.swift
//  applets-swift
//
//  Created by Mars Scala on 2020/11/10.
//

import UIKit
import WebKit

class AppletModuleWebView: WKWebView {
    let config = WKWebViewConfiguration()
    let manager : AppletsWidgetManager
    init(frame: CGRect, manager: AppletsWidgetManager) {
        self.manager = manager
        super.init(frame: frame, configuration: config)
        registerWidgets(widgets: manager.widgets)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func registerWidgets(widgets: [AppletsWidget]) {
        //
    }
}
