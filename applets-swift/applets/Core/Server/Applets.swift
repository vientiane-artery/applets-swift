//
//  Applets.swift
//  applets-swift
//
//  Created by Mars Scala on 2020/11/9.
//

import Foundation
import Swifter

protocol AppletEntry {
    var path :String { get }
}

protocol Applet {
    var appID       :String { get }
    var appName     :String { get }
    var publishAt   :Int64 { get }
    var createAt    :Int64 { get }
    var entries :[AppletEntry] { get }
}

protocol AppletsConfig {
    var port        :in_port_t { get }
//    var basePath    :String { get }
}

class Applets {
    struct DefaultConfig : AppletsConfig {
        var port: in_port_t = 8080
//        var basePath: String = Bundle.main.path(forResource: "/", ofType: nil)!
    }
    
    let server: HttpServer
    let config: AppletsConfig
    init(config: AppletsConfig = DefaultConfig()) {
        self.config = config
        server = HttpServer()
    }
    
    func loadModule(applet: Applet) -> Loader {
        let package = Package(applets: self, applet: applet)
        return Loader(package: package)
    }
    
    func start() {
        let server = HttpServer()
        server["/"] = scopes {
          html {
            body {
              center {
                img { src = "https://swift.org/assets/images/swift.svg" }
              }
            }
          }
        }
        var url = Bundle.main.bundleURL
        url.appendPathComponent("web")
        server["/web/:path"] = directoryBrowser(url.path)

        let semaphore = DispatchSemaphore(value: 0)
        do {
            try server.start(self.config.port, forceIPv4: true)
          print("Server has started ( port = \(try server.port()) ). Try to connect now...")
          semaphore.wait()
        } catch {
          print("Server start error: \(error)")
          semaphore.signal()
        }
    }
}

extension Applets {
    class Package {
        private let applets: Applets
        private let applet: Applet
        init(applets: Applets, applet: Applet) {
            self.applets = applets
            self.applet = applet
        }
        
        func url(entry: AppletEntry) -> String {
            return path(entry: entry)
        }
        
        func path(entry: AppletEntry) -> String {
            return "https://apple.com"
        }
    }
}

extension Applets {
    class Loader {
        private let package: Package
        private(set) var loading: Bool
        init(package: Package) {
            self.package = package
            loading = false
        }
        
        func url(entry: AppletEntry) -> String {
            return package.url(entry: entry)
        }
        
        func registerLoadingMonitor(loadingStatus: (Bool)->Void) {
            //
        }
    }
}
