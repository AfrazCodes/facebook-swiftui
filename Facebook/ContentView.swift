//
//  ContentView.swift
//  Facebook
//
//  Created by Afraz Siddiqui on 12/16/20.
//

import SwiftUI

struct FBPostModel: Hashable {
    let name: String
    let post: String
    let imageName: String
}

struct ContentView: View {

    @Binding var text: String

    let stories = ["story1", "story2", "story3","story1", "story2", "story3"]

    let posts: [FBPostModel] = [
        FBPostModel(name: "Mark Zuckerberg",
                    post: "Hey guys I made this cool website called thefacebook to see if Im cool or not!",
                    imageName: "person1"),
        FBPostModel(name: "Jeff Bezos",
                    post: "You'll all see once I take over the world with Amazon.",
                    imageName: "person2"),
        FBPostModel(name: "Bill Gates",
                    post: "Who cares - I made windows!",
                    imageName: "person3")
    ]

    let facebookBlue = UIColor(red: 23/255.0,
                               green: 120/255.0,
                               blue: 242/255.0,
                               alpha: 1)

    var body: some View {
        VStack {
            HStack {
                Text("facebook")
                    .font(.system(size: 48, weight: .bold, design: .default))
                    .foregroundColor(Color(facebookBlue))

                Spacer()

                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 45, height: 45, alignment: .center)
                    .foregroundColor(Color(.secondaryLabel))
            }
            .padding()

            TextField("Search...", text: $text)
                .padding(7)
                .background(Color(.systemGray5))
                .cornerRadius(13)
                .padding(.horizontal, 15)

            ZStack {
                Color(.secondarySystemBackground)

                ScrollView(.vertical) {
                    VStack {
                        StoriesView(stories: stories)

                        ForEach(posts, id: \.self) { model in
                            FBPost(model: model)
                            Spacer()
                        }
                    }
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(text: .constant(""))
    }
}
