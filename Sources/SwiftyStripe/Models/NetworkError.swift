//MIT License
//
//Copyright (c) 2017 Manny Guerrero
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

import Foundation

/// A struct that represents a network error that can occur.
public struct NetworkError: Error {
    
    // MARK: - Public Instance Attributes
    
    /// Respresents the error code of a network request.
    public let errorCode: Int
    
    /// Represents the description of the error.
    public let errorDescription: String
}


// MARK: - Network Errors
extension NetworkError {
    
    /// Represents when retrieving the metadata for a request failed.
    static var metadataError: NetworkError {
        return NetworkError(errorCode: 1001,
                            errorDescription: "Could not determine the metadata from request")
    }
    
    /// Represents when parsing a response failed.
    static var parseError: NetworkError {
        return NetworkError(errorCode: 1002, errorDescription: "Could not parse given response from request")
    }
}
