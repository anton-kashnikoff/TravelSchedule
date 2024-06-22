//
//  Story.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 09/06/2024.
//

import SwiftUI

struct Story: Identifiable {
    let id: Int
    let backgroundImage: Image
    let title: String
    let description: String

    static let story1 = Story(
        id: 0,
        backgroundImage: Image("Story1"),
        title: "Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 ",
        description: "Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 "
    )

    static let story2 = Story(
        id: 1,
        backgroundImage: Image("Story2"),
        title: "Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 ",
        description: "Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 "
    )

    static let story3 = Story(
        id: 2,
        backgroundImage: Image("Story3"),
        title: "Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 ",
        description: "Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 "
    )
    
    static let story4 = Story(
        id: 3,
        backgroundImage: Image("Story4"),
        title: "Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 ",
        description: "Text4 Text4 Text4 Text4 Text4 Text4 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 "
    )
    
    static let story5 = Story(
        id: 4,
        backgroundImage: Image("Story5"),
        title: "Text5 Text5 Text5 Text4 Text4 Text4 Text4 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 ",
        description: "Text5 Text5 Text4 Text4 Text4 Text4 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 "
    )
}
