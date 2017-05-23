//
//  UIViewController+Extension.swift
//  EjercicioCarrousel
//
//  Created by Gonza on 23/5/17.
//  Copyright © 2017 Nahuel. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

extension UIViewController {
    
    func showAlert(_ errorMessage: String) {
        
        let alertController: UIAlertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        let alertAction: UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func displayVideo(fromURL videoURL: String) {
        
        guard let url = URL(string: videoURL) else {
            return
        }
        let videoPlayer: AVPlayer = AVPlayer(url: url)
        
        let videoController: AVPlayerViewController = AVPlayerViewController()
        videoController.player = videoPlayer
        
        self.present(videoController, animated: true, completion: nil)
    }
}
