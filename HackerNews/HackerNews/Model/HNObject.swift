//
//  HNObject.swift
//  HackerNews
//
//  Created by Omar Albeik on 5/22/17.
//  Copyright © 2017 Omar Albeik. All rights reserved.
//

import ObjectMapper


class HNObject: Mappable {
	
	var author: String?
	var id: Int?
	var title: String?
	var text: String?
	var descendants: Int?
	var score: Int?
	var parentId: Int?
	var kidsIds: [Int]?
	var time: Date?
	var url: URL?
	var pollId: Int?
	var type: HNObjectType?
	
	required init?(map: Map) {
	}
	
	func mapping(map: Map) {
		author		<- map["by"]
		id			<- map["id"]
		title		<- map["title"]
		text		<- map["text"]
		descendants	<- map["descendants"]
		score		<- map["score"]
		parentId	<- map["parent"]
		kidsIds		<- map["kids"]
		time		<- (map["time"], DateTransform())
		url			<- (map["url"], URLTransform())
		pollId		<- map["poll"]
		type		<- (map["type"], EnumTransform())
	}
	
}


// MARK: - CustomStringConvertible
extension HNObject: CustomStringConvertible {
	
	var description: String {
		return toJSONString(prettyPrint: true) ?? ""
	}
	
}


// MARK: - Equatable
extension HNObject: Equatable {
	
	static func ==(lhs: HNObject, rhs: HNObject) -> Bool {
		return lhs.id == rhs.id
	}
	
}
