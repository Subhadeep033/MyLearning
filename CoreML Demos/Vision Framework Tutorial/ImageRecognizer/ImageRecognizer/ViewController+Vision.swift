//
//  ViewController+Vision.swift
//  ImageRecognizer
//
//  Created by DAPL-Asset-290 on 26/03/20.
//  Copyright © 2020 DAPL-Asset-290. All rights reserved.
//

import UIKit
import Vision

extension ViewController {
    
    //MARK: - Create Rectangle Request In Image ----
    
    var detectatedRectanglesRequest : VNDetectRectanglesRequest {
        let request = VNDetectRectanglesRequest { (request, error) in
            if let detectError = error as NSError? {
                print("Detected Error =",detectError)
                return
            }
            else{
                guard let observetions = request.results as? [VNDetectedObjectObservation] else{
                    return
                }
                print("Observations =",observetions)
                self.visualizeRectangles(observetions)
            }
        }
        request.maximumObservations = 0
                
        return request
    }
    
    //MARK: - Create Face Recognization Request In Image ----
    
    var detectatedFacesRequest : VNDetectFaceRectanglesRequest {
        let request = VNDetectFaceRectanglesRequest { (request, error) in
            if let detectError = error as NSError? {
                print("Detected Error =",detectError)
                return
            }
            else{
                guard let observetions = request.results as? [VNDetectedObjectObservation] else{
                    return
                }
                print("Observations =",observetions)
                self.visualizeRectangles(observetions)
            }
        }
                
        return request
    }
    
    //MARK: - Create Text Recognization Request In Image ----
    
    var detectatedTextRequest : VNDetectTextRectanglesRequest {
        let request = VNDetectTextRectanglesRequest { (request, error) in
            if let detectError = error as NSError? {
                print("Detected Error =",detectError)
                return
            }
            else{
                guard let observetions = request.results as? [VNDetectedObjectObservation] else{
                    return
                }
                print("Observations =",observetions)
                self.visualizeRectangles(observetions)
            }
        }
                
        return request
    }
    
    //MARK: - Create Barcode Recognization Request In Image ----
    
    var detectatedBarCodeRequest : VNDetectBarcodesRequest {
        let request = VNDetectBarcodesRequest { (request, error) in
            if let detectError = error as NSError? {
                print("Detected Error =",detectError)
                return
            }
            else{
                guard let observetions = request.results as? [VNDetectedObjectObservation] else{
                    return
                }
                print("Observations =",observetions)
                self.visualizeRectangles(observetions)
            }
        }
                
        return request
    }
    
    //MARK: - Create Image Request Handler ----
    
    func performVisionRequest(image: UIImage) {
        guard let cgImage = image.cgImage else {
            return
        }
        
        let imageRequestHandler = VNImageRequestHandler(cgImage: cgImage,
                                                        orientation: image.cgImageOrientation,
                                                        options: [:])
        let imageRequest = [detectatedRectanglesRequest,detectatedTextRequest,detectatedFacesRequest,detectatedBarCodeRequest]
        
        DispatchQueue.global(qos: .userInitiated).async {
            do{
                try imageRequestHandler.perform(imageRequest)
            }
            catch let error as NSError{
                print("Error In ImageRequestHandler =",error)
                return
            }
        }
    }
    
    private func visualizeRectangles(_ observetions:[VNDetectedObjectObservation]){
        DispatchQueue.main.async {
            guard let image = self.imageView.image else{
                print("Image Retrivation Failed.")
                return
            }
            let imageSize = image.size
            var transform = CGAffineTransform.identity.scaledBy(x: 1, y: -1).translatedBy(x: 0, y: -imageSize.height)
            transform = transform.scaledBy(x: imageSize.width, y: imageSize.height)
            
            UIGraphicsBeginImageContextWithOptions(imageSize, true, 0.0)
            let context = UIGraphicsGetCurrentContext()
            
            image.draw(in: CGRect(origin: .zero, size: imageSize))
            context?.saveGState()
            
            context?.setLineWidth(8.0)
            context?.setLineJoin(.round)
            context?.setStrokeColor(UIColor.red.cgColor)
            context?.setFillColor(red: 0.8, green: 0, blue: 0, alpha: 0.3)
            
            observetions.forEach { (observation) in
                let observationBounds = observation.boundingBox.applying(transform)
                context?.addRect(observationBounds)
            }
            
            context?.drawPath(using: .fillStroke)
            context?.restoreGState()
            
            let drawnImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            self.imageView.image = drawnImage
            
        }
    }
    
}
