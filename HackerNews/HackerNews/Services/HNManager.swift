//
//  HNManager.swift
//  HackerNews
//
//  Created by Omar Albeik on 5/22/17.
//  Copyright © 2017 Omar Albeik. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


class HNManager {
	
	class func fetchItem(id: Int, _ completion: @escaping (_ item: HNItem?, _ error: Error?) -> Void) {
		Alamofire.request(itemURL(id: id)).responseObject { (response: DataResponse<HNItem>) in
			completion(response.result.value, response.error)
		}
	}
	
	class func fetchUser(id: String, _ completion: @escaping (_ user: HNUser?, _ error: Error?) -> Void) {
		Alamofire.request(userURL(id: id)).responseObject { (response: DataResponse<HNUser>) in
			completion(response.result.value, response.error)
		}
	}
	
	class func fetchMaxItemId(completion: @escaping (_ id: Int?, _ error: Error?) -> Void) {
		Alamofire.request(maxItemIdURL).responseJSON { response in
			completion(response.value as? Int, response.error)
		}
	}
	
	class func fetchMaxItem(completion: @escaping (_ item: HNItem?, _ error: Error?) -> Void) {
		fetchMaxItemId { id, error in
			guard let id = id else {
				completion(nil, error)
				return
			}
			fetchItem(id: id, completion)
		}
	}
	
	class func fetchTopStoriesIds(completion: @escaping (_ ids: [Int], _ error: Error?) -> Void) {
		Alamofire.request(topStoriesURL).responseJSON { response in
			completion((response.value as? [Int]) ?? [], response.error)
		}
	}
	
	class func fetchTopStories(completion: @escaping (_ stories: [HNItem?], _ error: Error?) -> Void) {
		fetchTopStoriesIds { ids, error in
			guard !ids.isEmpty else {
				completion([], error)
				return
			}
			
			var stories: [HNItem?] = []
			var count = 0
			for id in ids {
				fetchItem(id: id) { item, _ in
					stories.append(item)
					count += 1
					
					if count == ids.count {
						completion(stories, error)
					}
					
				}
			}
			
		}
	}
	
}

extension HNManager {
	
	fileprivate static var baseURL: URL {
		return URL(string: "https://hacker-news.firebaseio.com/v0")!
	}
	
	static func itemURL(id: Int) -> URL {
		return baseURL.appendingPathComponent("item/\(id).json?print=pretty")
	}
	
	static func userURL(id: String) -> URL {
		return baseURL.appendingPathComponent("user/\(id).json?print=pretty")
	}
	
	static var maxItemIdURL: URL {
		return baseURL.appendingPathComponent("maxitem.json?print=pretty")
	}
	
	static var topStoriesURL: URL {
		return baseURL.appendingPathComponent("topstories.json?print=pretty")
	}
	
	static var newStoriesURL: URL {
		return baseURL.appendingPathComponent("newstories.?print=pretty")
	}
	
	static var bestStoriesURL: URL {
		return baseURL.appendingPathComponent("beststories.json?print=pretty")
	}
	
}
