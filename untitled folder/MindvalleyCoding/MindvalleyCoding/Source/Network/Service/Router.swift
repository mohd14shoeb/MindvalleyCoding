//
//  Router.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import Foundation

// MARK: typealias for routerCompletion response
public typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

// MARK: Protocol declare for NetworkRouter
protocol NetworkRouter: AnyObject {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, isCacheEnable: Bool, completion: @escaping NetworkRouterCompletion)
    func cancel()
}

// MARK: Protocol Implementation for NetworkRouter
class Router<EndPoint: EndPointType>: NetworkRouter {
    
    // MARK: private  Properties
    private var task: URLSessionTask?
    private var isCacheEnable: Bool = false
    
    // MARK: URLCache
    lazy var cache: URLCache = {
        let cachesURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let diskCacheURL = cachesURL.appendingPathComponent("DownloadCache")
        let cache = URLCache(memoryCapacity: 100_000_000, diskCapacity: 1_000_000_000, directory: diskCacheURL)
#if DEBUG
        print("Cache path: \(diskCacheURL.path)")
#endif
        
        return cache
    }()
    
    // MARK: URLSession
    lazy var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.urlCache = cache
        return URLSession(configuration: config)
    }()
    
    // MARK: Request dataTask
    func request(_ route: EndPoint, isCacheEnable: Bool, completion: @escaping NetworkRouterCompletion) {
        do {
            self.isCacheEnable = isCacheEnable
            let request = try self.buildRequest(from: route)
            if !NetworkMonitor.shared.isReachable && self.isCacheEnable {
                getCacheStoreData(request: request) { data, response, error in
                    completion(data, response, error)
                    return
                }
            } else {
                task = session.dataTask(with: request,
                                        completionHandler: { data, response, error in
                    NetworkLogger.log(responseData: data,
                                      response: response, error: error)
                    self.storeCacheData(request: request, response: response as? HTTPURLResponse, data: data)
                    completion(data, response, error)
                })
            }
        } catch {
            NetworkLogger.log(error: error)
            completion(nil, nil, error)
        }
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    // MARK: Build Request
    private func buildRequest(from route: EndPoint) throws -> URLRequest {
        guard let base = URL(string: route.baseURL.absoluteString) else { fatalError("baseURL could not be configured.") }
        let baseAppend = base.appendingPathComponent(route.path).absoluteString.removingPercentEncoding ?? ""
        guard let url = URL(string: baseAppend) else { fatalError("baseURL could not be configured.") }
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60.0)
        request.httpMethod = route.httpMethod.rawValue
        
        return request
    }
}


extension Router {
    // MARK: Fetch the Cache response
    func getCacheStoreData(request: URLRequest, completion: @escaping NetworkRouterCompletion) {
        if let cachedResponse = self.cache.cachedResponse(for: request) {
            NetworkLogger.log(responseData: cachedResponse.data,
                              response: cachedResponse.response, error: nil)
            completion(cachedResponse.data, cachedResponse.response, nil)
            return
        } else {
            completion(nil, nil, NSError(domain: "Please check your device network", code: 601))
        }
    }
    
    // MARK: Store the Cache response
    func storeCacheData(request: URLRequest, response: HTTPURLResponse?, data: Data?) {
        if let response = response, let data = data, self.isCacheEnable {
            switch response.statusCode {
            case 200...299:
                self.cache.removeCachedResponse(for: request)
                self.cache.storeCachedResponse(CachedURLResponse(response: response, data: data), for: request)
            default:
                break
            }
        }
    }
}
