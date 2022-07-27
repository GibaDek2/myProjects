// MARK: - CardSet
struct CardSet: Codable {
    let setName, setCode: String?
    let setRarity: SetRarity?
    let setRarityCode: SetRarityCode?
    let setPrice: String?

    enum CodingKeys: String, CodingKey {
        case setName = "set_name"
        case setCode = "set_code"
        case setRarity = "set_rarity"
        case setRarityCode = "set_rarity_code"
        case setPrice = "set_price"
    }
}
