// MARK: - CardImage
struct CardImage: Codable {
    let id: Int?
    let imageURL, imageURLSmall: String?

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "image_url"
        case imageURLSmall = "image_url_small"
    }
}
