//
//  AEFirstViewController.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/28.
//

import Foundation
import UIKit
import SwiftUI

class AEFirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.addSubview(button)
        
        let view = self.view // 可以获取 view
        view?.inputViewController?.navigationItem.title = "XX"
    }
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Open SwiftUI View", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.setTitleColor(.orange, for: .normal)
        button.sizeToFit()
        button.center = view.center
        button.addTarget(self, action: #selector(openContentView),
                         for: .touchUpInside)
        return button
    }()
    
    @objc func openContentView() {
        
        let hostVC = UIHostingController(rootView: FirstPageView())
        present(hostVC, animated: true, completion: nil)
    }
}
