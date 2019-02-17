//
//  VideoHelper.swift
//  Uplift
//
//  Created by Matthew Rodriguez on 2/16/19.
//  Copyright © 2019 Matthew Rodriguez. All rights reserved.
//

import AVFoundation
import UIKit
import MobileCoreServices

class VideoHelper {
    static func startMediaBrowser(delegate: UIViewController & UINavigationControllerDelegate & UIImagePickerControllerDelegate, sourceType: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(sourceType) else { return }
        
        let mediaUI = UIImagePickerController()
        mediaUI.sourceType = sourceType
        mediaUI.mediaTypes = [kUTTypeMovie as String]
        mediaUI.allowsEditing = true
        mediaUI.delegate = delegate
        delegate.present(mediaUI, animated: true, completion: nil)
    }
}
