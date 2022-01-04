//
//  MeView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/4.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct MeView: View {
    let context = CIContext()
    
    let filter = CIFilter.qrCodeGenerator()
    
    @State private var name = ""
    @State private var phone = ""
    
    var body: some View {
        VStack {
            TextField("姓名", text: $name)
                .font(.title)
                .padding(.horizontal)
            TextField("电话", text: $phone)
                .font(.title)
                .keyboardType(.numberPad)
                .padding(.horizontal)
            Image(uiImage: generateQRCode("\(name)\n\(phone)"))
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Spacer()
        }
        .navigationTitle("我的二维码")
    }
    
    func generateQRCode(_ str: String) -> UIImage {
        filter.setValue(Data(str.utf8), forKey: "inputMessage")
        
        if let outputImage = filter.outputImage,
           let cgImage = context.createCGImage(outputImage, from: outputImage.extent)
        {
            return UIImage(cgImage: cgImage)
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
