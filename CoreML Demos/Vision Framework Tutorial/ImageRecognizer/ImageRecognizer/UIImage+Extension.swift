//
//  UIImage+Extension.swift
//  ImageRecognizer
//
//  Created by DAPL-Asset-290 on 26/03/20.
//  Copyright © 2020 DAPL-Asset-290. All rights reserved.
//

import UIKit

extension UIImage {
    var cgImageOrientation : CGImagePropertyOrientation {
        switch imageOrientation {
            case .up : return .up
            case .upMirrored: return .upMirrored
            case .down: return .down // 0th row at bottom, 0th column on right  - 180 deg rotation
            case .downMirrored : return .downMirrored// 0th row at bottom, 0th column on left   - vertical flip
            case .leftMirrored : return .leftMirrored // 0th row on left,   0th column at top
            case .right : return .right // 0th row on right,  0th column at top    - 90 deg CW
            case .rightMirrored : return .rightMirrored // 0th row on right,  0th column on bottom
            case .left : return .left // 0th row on left,   0th column at bottom - 90 deg CCW
            default: return .up
        }
    }
}
