//
//  UIViewController+presentError.swift
//  WeatherSample
//
//  Created by 山浦功 on 2018/07/25.
//  Copyright © 2018年 KoYamaura. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    //エラーの表示
    func presentError() {
        let alertController = UIAlertController(title: Text.Dialogues.errorTitle, message: Text.Dialogues.errorMessage, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: Text.Dialogues.okayText, style: .default, handler: nil)
        alertController.addAction(okayAction)
        present(alertController, animated: true, completion: nil)
    }
}
