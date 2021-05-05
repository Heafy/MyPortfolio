//
//  VisionKitViewModel.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 13/04/21.
//

import Vision
import SwiftUI

class VisionKitViewModel: ObservableObject {
    
    @Published var texts: [String] = []

    func processImage() {
        guard let cgImage = UIImage(named: "testvision")?.cgImage else {
            print("No image")
            return
        }
        let requestHandler = VNImageRequestHandler(cgImage: cgImage)
        let request = VNRecognizeTextRequest(completionHandler: recognizeTextHandler(request:error:))
        request.recognitionLevel = .accurate
        //let request = VNRecognizeTextRequest(completion: recognizeTextHandler)
        do {
            // Perform the text-recognition request.
            try requestHandler.perform([request])
        } catch {
            print("Unable to perform the requests: \(error).")
        }
    }
    
    func recognizeTextHandler(request: VNRequest, error: Error?) {
        guard let observations =
                request.results as? [VNRecognizedTextObservation] else {
            return
        }
        let recognizedStrings = observations.compactMap { observation in
            // Return the string of the top VNRecognizedText instance.
            return observation.topCandidates(1).first?.string
        }
        
        // Process the recognized strings.
        //print(recognizedStrings)
        self.texts = recognizedStrings
    }
    
}
