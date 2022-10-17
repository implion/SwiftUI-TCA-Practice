//
//  FavoritePrime.swift
//  TCA
//
//  Created by implion on 2022/10/11.
//

import SwiftUI

struct FavoritePrime: View {
	
	@ObservedObject
	var state: AppState
	
	var body: some View {
		NavigationView {
			List {
				ForEach(state.favoritePrimes, id: \.self) { prime in
					Text("\(prime)")
				}.onDelete { indexSet in
					for index in indexSet {
						state.favoritePrimes.remove(at: index)
					}
				}
			}
			Spacer()
		}
	}
	
}

struct FavoritePrime_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePrime(state: AppState())
    }
}
