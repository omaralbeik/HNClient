//
//  HNUser.swift
//  HackerNews
//
//  Created by Omar Albeik on 5/22/17.
//  Copyright © 2017 Omar Albeik. All rights reserved.
//

import ObjectMapper


class HNUser: Mappable {
	
	var about: String?
	var dateCreated: Date?
	var delay: Int?
	var id: String?
	var karma: Int?
	var submittedStoriesIds: [Int]?
	
	required init?(map: Map) {
	}
	
	func mapping(map: Map) {
		about               <- map["about"]
		dateCreated         <- (map["created"], DateTransform())
		delay               <- map["delay"]
		id                  <- map["id"]
		karma               <- map["karma"]
		submittedStoriesIds <- map["submitted"]
		
	}
	
}


extension HNUser {
	
	func fetchStories(_ completion: @escaping (_ stories: [HNObject]) -> Void) {
		guard let ids = submittedStoriesIds, !ids.isEmpty else {
			completion([])
			return
		}
		var fetchedCount = 0
		var stories: [HNObject] = []
		for id in ids {
			HNManager.fetchObject(id: id) { object, _ in
				if let story = object {
					stories.append(story)
					fetchedCount += 1
				}
				if fetchedCount == ids.count {
					completion(stories)
				}
			}
		}
	}
	
}


// MARK: - CustomStringConvertible
extension HNUser: CustomStringConvertible {
	
	var description: String {
		return toJSONString(prettyPrint: true) ?? ""
	}
	
}


// MARK: - Equatable
extension HNUser: Equatable {
	
	static func ==(lhs: HNUser, rhs: HNUser) -> Bool {
		return lhs.id == rhs.id
	}
	
}
