// MARK: - Stat
struct Stat: Codable {
    let baseStat, effort: Int?
    let stat: Species?

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}
