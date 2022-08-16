// MARK: - GenerationIii
struct GenerationIii: Codable {
    let emerald: Emerald?
    let fireredLeafgreen, rubySapphire: Gold?

    enum CodingKeys: String, CodingKey {
        case emerald
        case fireredLeafgreen = "firered-leafgreen"
        case rubySapphire = "ruby-sapphire"
    }
}
