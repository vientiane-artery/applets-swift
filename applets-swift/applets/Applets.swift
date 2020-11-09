//
//  Applets.swift
//  applets-swift
//
//  Created by Mars Scala on 2020/11/9.
//

import Foundation
import Swifter

public protocol Applet {
    
}

protocol AppletsModule {
    
}

public class Applets {
    let server = HttpServer()
    public func loadModule(applet: Applet) -> Loader {
        let package = Package(applets: self, applet: applet)
        return Loader(package: package)
    }
    
    func startTest() {
        let server = HttpServer()
//        server["/"] = scopes {
//          html {
//            body {
//              center {
//                img { src = "https://swift.org/assets/images/swift.svg" }
//              }
//            }
//          }
//        }
        server["/files/:path"] = directoryBrowser("/")

        let semaphore = DispatchSemaphore(value: 0)
        do {
          try server.start(9080, forceIPv4: true)
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
    }
}

extension Applets {
    public class Loader {
        private let package: Package
        init(package: Package) {
            self.package = package
        }
    }
}
