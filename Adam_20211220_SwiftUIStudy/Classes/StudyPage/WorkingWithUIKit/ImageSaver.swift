//
//  ImageSaver.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/4.
//

import UIKit

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func save(_ uiImage: UIImage) {
        UIImageWriteToSavedPhotosAlbum(uiImage, self, #selector(saveError), nil)
    }
    
    @objc func saveError(_ image: UIImage, _ error: Error?, _ contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
