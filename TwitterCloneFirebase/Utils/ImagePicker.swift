//
//  ImagePicker.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 8.09.2022.
//










import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage: UIImage?

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {

        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator

        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }

            parent.presentationMode.wrappedValue.dismiss()
        }

    }
}






//struct ImagePicker: UIViewControllerRepresentable {
//    @Binding var selectedImage: UIImage?
//    @Environment(\.presentationMode) var presentatinMode
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(self)
//    }
//
//    func makeUIViewController(context: Context) -> some UIViewController {
//        let picker = UIImagePickerController()
//        picker.delegate = context.coordinator
//        return picker
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//        print("")
//    }
//}
//
//    extension ImagePicker{
//
//        class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
//            let parent: ImagePicker
//
//            init(_ parent: ImagePicker){
//                self.parent = parent
//            }
//
//            func imagePickerControllerDidCancel(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info : [UIImagePickerController.InfoKey: Any]) {
//                guard let image = info[.originalImage] as? UIImage else {return}
//                parent.selectedImage = image
//                parent.presentatinMode.wrappedValue.dismiss()
//            }
//        }
//    }
//
