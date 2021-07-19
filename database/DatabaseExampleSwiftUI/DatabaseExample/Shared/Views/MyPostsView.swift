//
//  Copyright (c) 2021 Google Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import SwiftUI
import Firebase

struct MyPostsView: View {
  @ObservedObject var user: UserViewModel

  var body: some View {
    NavigationView {
      List {
        ForEach(user.myPosts) { post in
          PostCellView(post: post)
        }
      }
      .onAppear {
        user.fetchMyPosts()
      }
      .navigationBarTitle("My Posts")
      .navigationBarItems(leading:
        Button(action: {
          user.logout()
        }) {
          HStack {
            Image(systemName: "chevron.left")
            Text("Logout")
          }
        },
        trailing:
        NavigationLink(destination: NewPostsView(user: user)) {
          Image(systemName: "plus")
        })
    }
  }
}

struct MyPostsView_Previews: PreviewProvider {
  static var previews: some View {
    MyPostsView(user: user)
  }
}