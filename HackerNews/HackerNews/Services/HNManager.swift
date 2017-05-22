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
	
	class func fetchObject(id: Int, _ completion: @escaping (_ object: HNObject?, _ error: Error?) -> Void) {
		Alamofire.request(objectURL(id: id)).responseObject { (response: DataResponse<HNObject>) in
			completion(response.result.value, response.error)
		}
	}
	
	class func fetchUser(id: String, _ completion: @escaping (_ user: HNUser?, _ error: Error?) -> Void) {
		Alamofire.request(userURL(id: id)).responseObject { (response: DataResponse<HNUser>) in
			completion(response.result.value, response.error)
		}
	}
	
}

extension HNManager {
	
	fileprivate static var baseURL: URL {
		return URL(string: "https://hacker-news.firebaseio.com/v0")!
	}
	
	static func objectURL(id: Int) -> URL {
		return baseURL.appendingPathComponent("item/\(id).json?print=pretty")
	}
	
	static func userURL(id: String) -> URL {
		return baseURL.appendingPathComponent("user/\(id).json?print=pretty")
	}

}
