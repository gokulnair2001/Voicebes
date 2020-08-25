//
//  FileManager.swift
//  PlayIt WatchKit Extension
//
//  Created by Gokul Nair on 25/08/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import Foundation

extension FileManager{
    func getDocumentsDirectory() -> URL {
        let path = urls(for: .documentDirectory, in: .userDomainMask)
        return path[0];
    }
}
