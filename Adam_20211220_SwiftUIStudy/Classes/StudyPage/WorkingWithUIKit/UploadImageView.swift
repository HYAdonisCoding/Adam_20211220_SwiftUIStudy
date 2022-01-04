//
//  UploadImageView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/4.
//

import SwiftUI

struct UploadImageView: View {
    @State private var image: Image?
    @State private var uiImage: UIImage?
    @State private var showSheet = false
    
    var body: some View {
        VStack {
            if image != nil {
                image?.resizable().scaledToFit()
            } else {
                Button("Choose image") {
                    self.showSheet.toggle()
                }
            }
        }
        .navigationTitle("SwiftUI&UIKit")
        .sheet(isPresented: $showSheet,  onDismiss: convertUIImage) {
            
            ImagePickerView(uiImage: self.$uiImage)
        }
        .navigationBarItems(//leading: ButtonToggleStyle(),
            trailing: Button("Save", action: {
                guard let uiImage = uiImage else {
                    return
                }
                let imageSaver = ImageSaver()
                imageSaver.successHandler = {
                    print("save success")
                }
                imageSaver.errorHandler = { error in
                    print(error.localizedDescription)
                }
                imageSaver.save(uiImage)
                
                
            })
        )
        
    }
    
    func convertUIImage() {
        guard let uiImage = uiImage else {
            return
        }
        image = Image(uiImage: uiImage)
    }
}

struct UploadImageView_Previews: PreviewProvider {
    static var previews: some View {
        UploadImageView()
    }
}
