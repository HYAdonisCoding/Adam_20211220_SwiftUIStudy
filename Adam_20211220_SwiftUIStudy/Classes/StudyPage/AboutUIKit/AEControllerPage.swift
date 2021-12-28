//
//  AEControllerPage.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/28.
//

import UIKit
import SwiftUI

struct AEControllerPage<T: UIViewController>: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<AEControllerPage>) -> UIViewController {
        debugPrint("\(#function)：\(type(of: T.self))")
        let vc = T()
        
        configUI(vc)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<AEControllerPage>) {
        
        debugPrint("\(#function)：\(type(of: T.self))")
    }
    
    
    func configUI(_ vc: UIViewController) {
        
        
    }
}

