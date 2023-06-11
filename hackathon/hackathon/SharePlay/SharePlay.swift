//
//  SharePlay.swift
//  hackathon
//
//  Created by Luz Racca on 10/06/2023.
//

import Foundation
import GroupActivities
import UIKit

struct MatchProfilesTogether: GroupActivity {
    static let activityIdentifier = "com.hackathon.share-play-poc.sync-profiles"

    let orderUUID: UUID
    let truckName: String

    var metadata: GroupActivityMetadata {
        var metadata = GroupActivityMetadata()
        metadata.title = "Sync recruitment profiles"
        metadata.subtitle = truckName
        metadata.previewImage = UIImage(named: "ActivityImage")?.cgImage
        metadata.type = .exploreTogether // or .generic
        return metadata
    }
}
