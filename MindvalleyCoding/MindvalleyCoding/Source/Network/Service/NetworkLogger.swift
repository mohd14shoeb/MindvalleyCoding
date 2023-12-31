//
//  NetworkLogger.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import Foundation

class NetworkLogger {

    // MARK: Static NetworkLogger for URLRequest
    static func log(request: URLRequest) {
#if DEBUG
       
        print("\n - - - - - - - - - - OUTGOING Request - - - - - - - - - - \n")
        defer { print("\n - - - - - - - - - -  END - - - - - - - - - - \n") }

        let urlAsString = request.url?.absoluteString ?? ""
        let urlComponents = NSURLComponents(string: urlAsString)

        let method = request.httpMethod != nil ? "\(request.httpMethod ?? "")" : ""
        let path = "\(urlComponents?.path ?? "")"
        let query = "\(urlComponents?.query ?? "")"
        let host = "\(urlComponents?.host ?? "")"

        var logOutput = """
                        \(urlAsString) \n\n
                        \(method) \(path)?\(query) HTTP/1.1 \n
                        HOST: \(host)\n
                        """
        for (key, value) in request.allHTTPHeaderFields ?? [:] {
            logOutput += "\(key): \(value) \n"
        }

        if let body = request.httpBody {
            logOutput += "\n \(NSString(data: body, encoding: String.Encoding.utf8.rawValue) ?? "")"
        }
        print(logOutput)
#endif
    }

    // MARK: Static NetworkLogger for URLResponse
    static func log(responseData data: Data?, response: URLResponse?, error: Error?) {
#if DEBUG
      //  print("\n - - - - - - - - - - INCOMING Response - - - - - - - - - - \n")
      //  defer { print("\n - - - - - - - - - -  END - - - - - - - - - - \n") }
        guard let data = data else {
            print("INCOMING Error: \(String(describing: error))")
            return print(" INCOMING response: \(String(describing: response))")

        }
        if let dataDict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            print("responseData: \(String(describing: dataDict))")

        }
#endif
    }

    // MARK: Static NetworkLogger for Error
    static func log(error: Error) {
#if DEBUG
        print("\n - - - - - - - - - - INCOMING Error - - - - - - - - - - \n")
        defer { print("\n - - - - - - - - - -  END - - - - - - - - - - \n") }
        print("\(error)")
#endif
    }
}
