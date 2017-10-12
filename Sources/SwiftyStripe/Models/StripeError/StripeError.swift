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

/// A struct that represents an error that Stripe would return.
/// See [Stripe's API docs on errors](https://stripe.com/docs/api#errors)
/// for more information.
public struct StripeError: Error {
    
    // MARK: - Public Instance Attributes
    
    /// The type of error returned. Can be `api_connection_error`, `api_error`, `authentication_error`,
    /// `card_error`, `invalid_request_error`, `rate_limit_error`.
    public private(set) var type: String
    
    /// The ID of the failed charge.
    public private(set) var chargeId: Int?
    
    /// A human-readable message providing more details about the error. For card errors,
    /// these messages can be shown to your users.
    public private(set) var message: String?
    
    /// For card errors, a short string from amongst those listed on the right describing the kind of card
    /// error that occurred.
    public private(set) var code: String?
    
    /// For card errors resulting from a bank decline, a short string indicating the bank's reason for the
    /// decline if they provide one.
    public private(set) var declineCode: String?
    
    /// The parameter the error relates to if the error is parameter-specific. You can use this to display a
    /// message near the correct form field, for example.
    public private(set) var param: String?
    
    
    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case chargeId = "charge"
        case message = "message"
        case code = "code"
        case declineCode = "decline_code"
        case param = "param"
    }
}


// MARK: - Decodable
extension StripeError: Decodable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decode(String.self, forKey: .type)
        chargeId = try values.decodeIfPresent(Int.self, forKey: .chargeId)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        declineCode = try values.decodeIfPresent(String.self, forKey: .declineCode)
        param = try values.decodeIfPresent(String.self, forKey: .param)
    }
}


/// A struct that represents the actually response Stripe will return when recieving an error.
/// The response would look something like this:
/// ````
/// {
///     "error": {
///        "type": "invalid_request_error",
///        "message": "You did not provide an API key."
///     }
/// }
/// ````
struct StripeErrorResponse: Decodable {
    let error: StripeError
}
