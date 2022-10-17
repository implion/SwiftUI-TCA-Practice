//
//  Counter.swift
//  TCA
//
//  Created by implion on 2022/10/17.
//

import SwiftUI
import ComposableArchitecture

struct Counter: Equatable {
	var count = 0
}

enum CounterAction {
	case increment
	case decrement
	case reset
}

struct CounterEnvironment { }

let counterReducer = Reducer<Counter, CounterAction, CounterEnvironment> {
	state, action, _ in
	
	switch action {
	case .increment:
		state.count += 1
		return .none
	case .decrement:
		state.count -= 1
		return .none
	case .reset:
		state.count = 0
		return .none
	}
}



struct CounterView: View {
	let store: Store<Counter, CounterAction>
	var body: some View {
		
		WithViewStore(store) { viewStore in
			VStack {
				HStack {
					Button("-") {
						viewStore.send(.decrement)
					}
					Text("\(viewStore.count)")
						.foregroundColor(viewStore.count >= 0 ? Color.green : Color.red)
					Button("+") {
						viewStore.send(.increment)
					}
				}
				Button("Reset") {
					viewStore.send(.reset)
				}
			}
		}
		.font(.title)
	}
}

struct CounterView_Previews: PreviewProvider {
	static var previews: some View {
		CounterView(store: Store<Counter, CounterAction>(
			initialState: Counter(),
			reducer: counterReducer,
			environment: CounterEnvironment()))
	}
}
