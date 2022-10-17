//
//  TCAApp.swift
//  TCA
//
//  Created by implion on 2022/10/11.
//

import SwiftUI

@main
struct TCAApp: App {
	init() {
		state = AppState()
		
	}
	
	// 监测APP生命周期
	@Environment(\.scenePhase) private var scenePhase
	
	@ObservedObject
	var state: AppState
	
    var body: some Scene {
        WindowGroup {
            ContentView(state: state)
        }
		.onChange(of: scenePhase) { newValue in
			switch newValue {
			case .active: break
				
			case .background: break
				
			case .inactive: break
				
			@unknown default: break
				
			}
		}
		
	}
	
}
