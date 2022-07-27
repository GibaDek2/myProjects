// MARK: - CardPrice
struct CardPrice: Codable {
    let cardmarketPrice, tcgplayerPrice, ebayPrice, amazonPrice: String?
    let coolstuffincPrice: String?

    enum CodingKeys: String, CodingKey {
        case cardmarketPrice = "cardmarket_price"
        case tcgplayerPrice = "tcgplayer_price"
        case ebayPrice = "ebay_price"
        case amazonPrice = "amazon_price"
        case coolstuffincPrice = "coolstuffinc_price"
    }
}
