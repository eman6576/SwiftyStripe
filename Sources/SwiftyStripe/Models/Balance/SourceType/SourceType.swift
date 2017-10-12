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

/// A class that represents the type of source being used for an associated `BalanceCurrency`.
public final class SourceType: Codable {

    // MARK: - Public Instance Attributes

    /// The card number for a credit card being used.
    public let cardNumber: Int

    /// The bank account number associated with a credit card.
    public let bankAccountNumber: Int?

    /// The Bitcoin reciever being used.
    public let bitcoinReceiver: Int?


    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case cardNumber = "card"
        case bankAccountNumber = "bank_account"
        case bitcoinReceiver = "bitcoin_receiver"
    }
}
