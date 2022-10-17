//
//  ContentView.swift
//  TCA
//
//  Created by implion on 2022/10/11.
//

import SwiftUI

struct ContentView: View {
	
	@ObservedObject
	var state: AppState
	
    var body: some View {
		NavigationView {
			List {
				NavigationLink(destination: CounterDemo(state: state)) {
					Text("Counter Demo")
				}
				
				NavigationLink(destination: FavoritePrime(state: state)) {
					Text("Favorite primes")
				}
				
			}.navigationBarTitle("State Manager")
		}
	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(state: AppState())
    }
}
