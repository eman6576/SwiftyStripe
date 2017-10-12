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

/// A struct that represents the detailed breakdown of fees (in cents) paid for an associated
/// `BalanceTransaction`.
public struct FeeDetail: Codable {
    
    // MARK: - Public Instance Attributes
    
    /// Amount of the fee, in cents.
    public let amount: Int
    
    /// Documentation not available for this attribute. Stay tuned for updates.
    public let application: String?
    
    /// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) in lowercase. Must
    /// be a [supported currency](https://stripe.com/docs/currencies) .
    public let currency: String
    
    /// An arbitrary string attached to the object. Often useful for displaying to users.
    public let description: String?
    
    /// Type of the fee, one of: `application_fee`, `stripe_fee`, or `tax`.
    public let feeType: String
    
    
    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case application = "application"
        case currency = "currency"
        case description = "description"
        case feeType = "type"
    }
}
