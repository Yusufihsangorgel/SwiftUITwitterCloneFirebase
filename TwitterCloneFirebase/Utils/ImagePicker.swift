//
//  ImagePicker.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 8.09.2022.
//







import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentatinMode
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        <#code#>
    }
}

    extension ImagePicker{

        class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
            let parent: ImagePicker

            init(_ parent: ImagePicker){
                self.parent = parent
            }
            
            func imagePickerControllerDidCancel(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info : [UIImagePickerController.InfoKey: Any]) {
                guard let image = info[.originalImage] as? UIImage else {return}
                parent.selectedImage = image
                parent.presentatinMode.wrappedValue.dismiss()
            }
        }
    }

