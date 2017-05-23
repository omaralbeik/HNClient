//
//  HNUser.swift
//  HackerNews
//
//  Created by Omar Albeik on 5/22/17.
//  Copyright © 2017 Omar Albeik. All rights reserved.
//

import ObjectMapper


public class HNUser: Mappable {
	
	public var about: String?
	public var dateCreated: Date?
	public var delay: Int?
	public var id: String?
	public var karma: Int?
	public var submittedStoriesIds: [Int]?
	
	required public init?(map: Map) {
	}
	
	public func mapping(map: Map) {
		about               <- map["about"]
		dateCreated         <- (map["created"], DateTransform())
		delay               <- map["delay"]
		id                  <- map["id"]
		karma               <- map["karma"]
		submittedStoriesIds <- map["submitted"]
		
	}
	
}


// MARK: - CustomStringConvertible
extension HNUser: CustomStringConvertible {
	
	public var description: String {
		return toJSONString(prettyPrint: true) ?? ""
	}
	
}


// MARK: - Equatable
extension HNUser: Equatable {
	
	public static func ==(lhs: HNUser, rhs: HNUser) -> Bool {
		return lhs.id == rhs.id
	}
	
}
