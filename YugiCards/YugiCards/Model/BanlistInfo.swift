// MARK: - BanlistInfo
struct BanlistInfo: Codable {
    let banOcg, banGoat, banTcg: Ban?

    enum CodingKeys: String, CodingKey {
        case banOcg = "ban_ocg"
        case banGoat = "ban_goat"
        case banTcg = "ban_tcg"
    }
}
