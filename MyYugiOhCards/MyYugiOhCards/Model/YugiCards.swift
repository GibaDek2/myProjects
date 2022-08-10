// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let yugiCards = try? newJSONDecoder().decode(YugiCards.self, from: jsonData)

import Foundation

// MARK: - YugiCards
struct YugiCards: Codable {
    let type, carouselID, idMotor: String?
    let store: Bool?
    let contents: [Content]?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case type
        case carouselID = "carouselId"
        case idMotor, store, contents, title
    }
}

// MARK: - Content
struct Content: Codable {
    let hatType, percentageWatched: Int?
    let title, hashKey: String?
    let isBlocked, isCvod: Bool?
    let images: [Image]?
    let categories: String?
    let programType: ProgramType?
    let mediaType: MediaType?
    let contentDescription: String?
    let price: Price?
    let year: Int?
    let parentalRating: String?
    let idMotor: IDMotor?
    let eligibility: Eligibility?

    enum CodingKeys: String, CodingKey {
        case hatType, percentageWatched, title, hashKey, isBlocked, isCvod, images, categories, programType, mediaType
        case contentDescription = "description"
        case price, year, parentalRating, idMotor, eligibility
    }
}

enum Eligibility: String, Codable {
    case locker = "locker"
}

enum IDMotor: String, Codable {
    case defaultWithoutRecommendation = "defaultWithoutRecommendation"
}

// MARK: - Image
struct Image: Codable {
    let type, width, height: Int?
    let url: String?
}

enum MediaType: String, Codable {
    case movie = "MOVIE"
    case serie = "SERIE"
}

enum Price: String, Codable {
    case gratis = "Gratis"
}

enum ProgramType: String, Codable {
    case program = "Program"
    case serie = "Serie"
}
