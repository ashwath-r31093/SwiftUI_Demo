//
//  PeopleModel.swift
//  SwiftUI_Demo
//
//  Created by Ashwath Ramanan on 20/12/22.
//

import Foundation

struct Response: Decodable {
    let people: [People]
}

struct People: Decodable {
    let name: String
    let language: String?
}

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let language: String?
}
