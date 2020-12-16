//
//  StoriesView.swift
//  Facebook
//
//  Created by Afraz Siddiqui on 12/16/20.
//

import Foundation
import SwiftUI

struct StoriesView: View {
    let stories: [String]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 3) {
                ForEach(stories, id: \.self) { name in
                    Image(name)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 140, height: 200, alignment: .center)
                        .background(Color.red)
                        .clipped()
                }
            }
            .padding()
        }
    }
}
