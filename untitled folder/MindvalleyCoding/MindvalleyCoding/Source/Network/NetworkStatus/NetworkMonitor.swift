//
//  NetworkMonitor.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import Foundation
import Network

class NetworkMonitor {
    static let shared = NetworkMonitor()

    let monitor = NWPathMonitor()
    private var status: NWPath.Status = .requiresConnection
    var isReachable: Bool = false //{ status == .satisfied }
    var isReachableOnCellular: Bool = true

    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.status = path.status
            self?.isReachableOnCellular = path.isExpensive
            if path.status == .satisfied {
                print("We're connected!")
                self?.isReachable = true
            } else {
                print("No connection.")
                self?.isReachable = false
            }
            print(path.isExpensive)
        }

        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
//    func returnNetworkConnectionType(conectedTo: InterfaceType) -> String {
//        var networkName = ""
//        switch conectedTo {
//        case .
//        }
//        return networkName
//    }
    func stopMonitoring() {
        monitor.cancel()
    }
}
