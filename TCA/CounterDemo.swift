//
//  CounterDemo.swift
//  TCA
//
//  Created by implion on 2022/10/11.
//

import SwiftUI
import Combine


class AppState: ObservableObject {
	@Published var count = 10
	
	@Published var favoritePrimes: [Int] = [10]
}

struct CounterDemo: View {
	
	@ObservedObject
	var state: AppState

	
	@State
	var isPrimeModalShown = false
	
	@Environment(\.dismiss)
	var dismiss
	
    var body: some View {
		VStack {
			HStack {
				Button(action: {
					state.count -= 1
				}) {
					Text("-")
				}
				Text("\(state.count)")
				Button(action: {
					state.count += 1
				}) {
					Text("+")
				}
			}
			Button(action: {
				state.favoritePrimes.append(state.count)
				isPrimeModalShown = true
			}) {
				Text("Is this prime?")
			}
			Button(action: {}) {
				Text("what is the \(state.count)th prime")
			}
			
		}
		.font(.title)
		.popover(isPresented: $isPrimeModalShown) {
			Text("i don't know if \(state.count) is prime")
		}
		
		
		
	}
}

struct CounterDemo_Previews: PreviewProvider {
    static var previews: some View {
		CounterDemo(state: AppState())
    }
}
