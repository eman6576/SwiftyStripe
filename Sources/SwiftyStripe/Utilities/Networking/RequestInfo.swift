/**
* MIT License
*
* Copyright (c) 2017 Manny Guerrero
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in all
* copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*/

import Foundation

/// An enum that declares the supports HTTP methods.
///
/// - get: Represents a GET request to a resource.
/// - post: Represents a POST request to a resource.
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

/// A struct that encapsulates information for perfoming a network request.
struct RequestInfo {
    
    // MARK: - Public Instance Methods
    
    /// The url to perform the request to.
    let requestUrl: URL
    
    /// The HTTP method to use for the request.
    let requestMethod: HTTPMethod
    
    /// The authorization header value.
    let headerValues: [String: String]?
    
    /// The message body for the request.
    let messageBody: [String: Any]?
    
    /// The url request to use for making network requests.
    var urlRequest: URLRequest
    
    
    // MARK: - Initializers
    
    
    /// Initializes an instance of `RequestInfo`.
    ///
    /// - Parameters:
    ///   - requestUrl: An `URL` representing the url to perform the request to.
    ///   - requestMethod: A `HTTPMethod` representing the HTTP method to use for the request.
    ///   - headerValues: A `[String: String]` representing the headers to add to the request.
    ///   - messageBody: A `[String: Any` representing the message body of the request.
    init(requestUrl: URL,
         requestMethod: HTTPMethod,
         headerValues: [String: String]? = nil,
         messageBody: [String: Any]? = nil) {
        self.requestUrl = requestUrl
        self.requestMethod = requestMethod
        self.headerValues = headerValues
        self.messageBody = messageBody
        urlRequest = URLRequest(url: self.requestUrl)
        urlRequest.allHTTPHeaderFields = self.headerValues
        urlRequest.httpBody = try? JSONEncoder().encode(self.messageBody)
        urlRequest.httpMethod = self.requestMethod.rawValue
    }
}
