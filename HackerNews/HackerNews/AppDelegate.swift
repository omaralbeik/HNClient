//
//  AppDelegate.swift
//  HackerNews
//
//  Created by Omar Albeik on 5/22/17.
//  Copyright © 2017 Omar Albeik. All rights reserved.
//

import UIKit
import SwifterSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		HNManager.fetchTopStories { stories, _ in
			stories.forEach { print($0?.id ?? "") }
		}
		
//		HNManager.fetchItem(id: 126809) { item, error in
//			if let error = error {
//				print(error.localizedDescription)
//				return
//			}
//			print(item?.type)
//		}
//		
//		HNManager.fetchUser(id: "omaralbeik") { user, error in
//			if let error = error {
//				print(error.localizedDescription)
//				return
//			}
//			
//			print(user?.submittedStoriesIds?.count ?? 0)
//			
//			user?.fetchStories { stories in
//				
//				for story in stories {
//					print(story)
//					print()
//					print("*" * 100)
//					print()
//				}
//			}
//			
//		}
		
		return true
	}
	
}

