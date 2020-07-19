//
//  UserData.swift
//  Landmarks
//
//  Created by DAPL-Asset-290 on 01/07/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Combine
import SwiftUI


final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
