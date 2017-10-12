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

/// A struct that represents a balance transaction. Not a lot of information is given about this type
/// from Stripe. Stay tuned for updates.
public struct BalanceTransaction: Codable {
    
    // MARK: - Public Instance Attributes
    
    /// Unique identifier for the object.
    public let id: String
    
    /// String representing the object's type.
    public let objectType: String
    
    /// Gross amount of the transaction, in cents.
    public let amount: Int
    
    /// The date the transaction's net funds will become available in the Stripe balance.
    public let availableOn: TimeInterval
    
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public let created: TimeInterval
    
    /// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) in lowercase. Must
    /// be a [supported currency](https://stripe.com/docs/currencies) .
    public let currency: String
    
    /// An arbitrary string attached to the object. Often useful for displaying to users.
    public let description: String?
    
    /// Fees (in cents) paid for this transaction.
    public let fee: Int
    
    /// Detailed breakdown of fees (in cents) paid for this transaction.
    public let feeDetails: [FeeDetail]
    
    /// Net amount of the transaction, in cents.
    public let netAmount: Int
    
    /// The Stripe object this transaction is related to.
    public let source: String
    
    /// If the transaction's net funds are available in the Stripe balance yet. Either `available` or
    /// `pending`.
    public let status: String
    
    /// Transaction type: `adjustment`, `application_fee`, `application_fee_refund`, `charge`, `payment`,
    /// `payment_failure_refund`, `payment_refund`, `refund`, `transfer`, `transfer_refund`, `payout`,
    /// `payout_cancel`, `payout_failure`, `validation`, `stripe_fee`.
    public let transactionType: String
    
    
    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case objectType = "object"
        case amount = "amount"
        case availableOn = "avaliable_on"
        case created = "created"
        case currency = "currency"
        case description = "description"
        case fee = "fee"
        case feeDetails = "fee_details"
        case netAmount = "net"
        case source = "source"
        case status = "status"
        case transactionType = "type"
    }
}
