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

/// A struct that represents your Stripe balance.
/// See [Stripe's API docs on balances](https://stripe.com/docs/api/curl#balance)
/// for more information.
public struct Balance {
    
    // MARK: - Public Instance Attributes
    
    /// String representing the object’s type.
    public let objectType: String
    
    /// Funds that are available to be paid out automatically by Stripe or explicitly via the
    /// [transfers API](https://stripe.com/docs/api/curl#transfers) . The available balance for each currency
    /// and payment type can be found in the `sourceType` property.
    public let available: [BalanceCurrency]
    
    /// Funds held due to negative balances on connected Custom accounts. The connect reserve balance for
    /// each currency and payment type can be found in the `sourceType` property.
    public let connectReserved: [BalanceCurrency]
    
    /// Flag indicating whether the object exists in live mode or test mode.
    public let isLive: Bool
    
    /// Funds that are not available in the balance yet, due to the 7-day rolling pay cycle. The pending
    /// balance for each currency and payment type can be found in the `sourceType` property.
    public let pending: [BalanceCurrency]
    
    
    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case objectType = "object"
        case available = "available"
        case connectReserved = "connect_reserved"
        case isLive = "livemode"
        case pending = "pending"
    }
}


// MARK: - Decodable
extension Balance: Decodable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        objectType = try values.decode(String.self, forKey: .objectType)
        available = try values.decode([BalanceCurrency].self, forKey: .available)
        connectReserved = try values.decode([BalanceCurrency].self, forKey: .connectReserved)
        isLive = try values.decode(Bool.self, forKey: .isLive)
        pending = try values.decode([BalanceCurrency].self, forKey: .pending)
    }
}
