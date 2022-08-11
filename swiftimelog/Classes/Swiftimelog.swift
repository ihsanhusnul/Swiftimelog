//
//  Swiftimelog.swift
//  swiftimelog
//
//  Created by Ihsan Husnul Aqidah on 8/10/22.
//

import Foundation

public class Swiftimelog {
    public static let shared: Swiftimelog = Swiftimelog()
    
    private var timestamp: CFTimeInterval?
    
    private init() {
        
    }
    
    public class func begin() {
        Self.shared.timestamp = CFAbsoluteTimeGetCurrent()
    }
    
    private func log(of event: String) {
        guard let time = timestamp else {
            print("Swiftimelog not begin yet!")
            return
        }
        
        let elapsed: Double = (CFAbsoluteTimeGetCurrent() - time) * 1_000
        let log = String(format: "#Swiftimelog `%@` is %.0f", event, elapsed)
        print(log)
    }
    
    public class func start(event: String) {
        Self.shared.log(of: "start \(event)")
    }
    
    public class func end(event: String) {
        Self.shared.log(of: "end \(event)")
    }
    
    public class func event(_ event: String) {
        Self.shared.log(of: "\(event)")
    }
}
