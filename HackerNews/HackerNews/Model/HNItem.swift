//
//  HNItem.swift
//  HackerNews
//
//  Created by Omar Albeik on 5/22/17.
//  Copyright © 2017 Omar Albeik. All rights reserved.
//

import ObjectMapper


class HNItem: Mappable {
	
	/// Item's unique id.
	var id: Int?
	
	/// True if the item is deleted.
	var isDeleted: Bool?
	
	/// Type of item.
	var type: HNItemType?
	
	/// Username of the item's author.
	var author: String?
	
	/// Creation date of the item.
	var time: Date?
	
	/// The comment, story or poll text. HTML.
	var text: String?
	
	/// True if the item is dead.
	var isDead: Bool?
	
	/// Comment's parent: either another comment or the relevant story.
	var parentId: Int?
	
	/// Pollopt's associated poll.
	var pollId: Int?
	
	/// IDs of the item's comments, in ranked display order.
	var kidsIds: [Int]?

	/// URL of the story.
	var url: URL?

	/// Story's score, or the votes for a pollopt.
	var score: Int?

	/// The title of the story, poll or job.
	var title: String?
	
	/// List of related pollopts, in display order.
	var pollParts: [Int]?
	
	/// In the case of stories or polls, the total comment count.
	var descendants: Int?
	
	
	required init?(map: Map) {
	}
	
	func mapping(map: Map) {
		id          <- map["id"]
		isDeleted   <- map["deleted"]
		type        <- (map["type"], EnumTransform())
		author      <- map["by"]
		time        <- (map["time"], DateTransform())
		text        <- map["text"]
		isDead      <- map["dead"]
		parentId    <- map["parent"]
		pollId      <- map["poll"]
		kidsIds     <- map["kids"]
		url         <- (map["url"], URLTransform())
		score       <- map["score"]
		title       <- map["title"]
		pollParts   <- map["parts"]
		descendants <- map["descendants"]
	}
	
}


// MARK: - CustomStringConvertible
extension HNItem: CustomStringConvertible {
	
	var description: String {
		return toJSONString(prettyPrint: true) ?? ""
	}
	
}


// MARK: - Equatable
extension HNItem: Equatable {
	
	static func ==(lhs: HNItem, rhs: HNItem) -> Bool {
		return lhs.id == rhs.id
	}
	
}
