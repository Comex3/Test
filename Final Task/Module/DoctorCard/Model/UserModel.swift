//
//  Model.swift
//  Final Task
//
//  Created by Кирилл Мазепин on 11.04.2025.
//

import Foundation

// MARK: - Top-Level Response
struct UserResponse: Codable {
    let data: UserData
}

// MARK: - Data Container
struct UserData: Codable {
    let users: [User]
}

// MARK: - User
struct User: Codable, Identifiable {
    let id: String
    let slug: String
    let firstName: String
    let patronymic: String?
    let lastName: String
    let gender: String
    let genderLabel: String
    let specialization: [Specialization]
    let ratings: [Rating]
    let ratingsRating: Double
    let seniority: Int
    let textChatPrice: Int
    let videoChatPrice: Int
    let homePrice: Int
    let hospitalPrice: Int
    let avatar: String?
    let nearestReceptionTime: Int?
    let freeReceptionTime: [ReceptionTime]
    let educationTypeLabel: EducationTypeLabel?
    let higherEducation: [Education]
    let workExperience: [Experience]
    let advancedTraining: [Training]
    let rank: Int
    let rankLabel: String
    let scientificDegree: Int
    let scientificDegreeLabel: String
    let category: Int
    let categoryLabel: String
    let isFavorite: Bool

    enum CodingKeys: String, CodingKey {
        case id, slug
        case firstName = "first_name"
        case patronymic
        case lastName = "last_name"
        case gender
        case genderLabel = "gender_label"
        case specialization, ratings
        case ratingsRating = "ratings_rating"
        case seniority
        case textChatPrice = "text_chat_price"
        case videoChatPrice = "video_chat_price"
        case homePrice = "home_price"
        case hospitalPrice = "hospital_price"
        case avatar
        case nearestReceptionTime = "nearest_reception_time"
        case freeReceptionTime = "free_reception_time"
        case educationTypeLabel = "education_type_label"
        case higherEducation = "higher_education"
        case workExperience = "work_expirience"
        case advancedTraining = "advanced_training"
        case rank, rankLabel = "rank_label"
        case scientificDegree = "scientific_degree"
        case scientificDegreeLabel = "scientific_degree_label"
        case category, categoryLabel = "category_label"
        case isFavorite = "is_favorite"
    }
}

// MARK: - Supporting Models

struct Specialization: Codable {
    let id: Int
    let name: String
    let isModerated: Bool

    enum CodingKeys: String, CodingKey {
        case id, name
        case isModerated = "is_moderated"
    }
}

struct Rating: Codable {
    let id: Int
    let name: String
    let value: Double
}

struct ReceptionTime: Codable {
    let time: Int
}

struct EducationTypeLabel: Codable {
    let id: Int
    let name: String
}

struct Education: Codable {
    let id: Int
    let university: String
    let specialization: String
    let qualification: String
    let startDate: Int
    let endDate: Int
    let untilNow: Bool
    let isModerated: Bool

    enum CodingKeys: String, CodingKey {
        case id, university, specialization, qualification
        case startDate = "start_date"
        case endDate = "end_date"
        case untilNow = "until_now"
        case isModerated = "is_moderated"
    }
}

struct Experience: Codable {
    let id: Int
    let organization: String
    let position: String
    let startDate: Int
    let endDate: Int?
    let untilNow: Bool
    let isModerated: Bool

    enum CodingKeys: String, CodingKey {
        case id, organization, position
        case startDate = "start_date"
        case endDate = "end_date"
        case untilNow = "until_now"
        case isModerated = "is_moderated"
    }
}

struct Training: Codable {
    let id: Int
    let organization: String
    let position: String
    let endDate: Int
    let file: String
    let isModerated: Bool

    enum CodingKeys: String, CodingKey {
        case id, organization, position, file
        case endDate = "end_date"
        case isModerated = "is_moderated"
    }
}
