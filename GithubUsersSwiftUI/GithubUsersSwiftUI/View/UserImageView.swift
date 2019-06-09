//
//  UserImageView.swift
//  GithubUsersSwiftUI
//
//  Created by Ben Kray on 6/8/19.
//  Copyright © 2019 Ben Kray. All rights reserved.
//

import SwiftUI

struct UserImageView : View {

    let user: GithubUser
    @ObjectBinding var imageStore: UserImageStore

    var body: some View {
        let imageView: Image
        if let image = imageStore.load(image: user.avatarURL).image {
            imageView = image
        } else {
            imageView = Image(systemName: "person")
        }

        return imageView
            .resizable()
    }
}

#if DEBUG
struct AsyncImageView_Previews : PreviewProvider {
    static var previews: some View {
        let user = GithubUser(login: "nebyark", id: 1, nodeID: "", avatarURL: "", gravatarID: "", url: "", htmlURL: "https://someurl.com", followersURL: "", subscriptionsURL: "", organizationsURL: "", reposURL: "", receivedEventsURL: "", type: "", score: 60.0)
        return UserImageView(user: user, imageStore: UserImageStore())
    }
}
#endif
