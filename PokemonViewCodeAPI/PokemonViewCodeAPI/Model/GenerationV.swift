// MARK: - GenerationV
struct GenerationV: Codable {
    let blackWhite: Sprites?

    enum CodingKeys: String, CodingKey {
        case blackWhite = "black-white"
    }
}
