//
//  Theme.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 11/1/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import Foundation
import UIKit

enum Theme: Int {
  case light, dark
  
  static var current: Theme {
    let storedTheme = UserDefaults.standard.integer(forKey: UserKeys.selectedTheme)
    return Theme(rawValue: storedTheme) ?? .light
  }
  
  var mainColor: UIColor {
    switch self {
    case .light:
      return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
    case .dark:
      return UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1)
    }
  }
  
  var globalTintColor: UIColor {
    switch self {
    case .light:
      return UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1)
    case .dark:
      return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
    }
  }
  
  func apply() {
    UserDefaults.standard.set(rawValue, forKey: UserKeys.selectedTheme)
    UserDefaults.standard.synchronize()
    
    UIApplication.shared.delegate?.window??.tintColor = mainColor
  }
}