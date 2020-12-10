//
//  pd-manager.swift
//  SynthPD
//
//  Created by otavio on 10/12/20.
//

import Foundation
import libpd_ios

class PDManager {
    private let controller: PdAudioController
    
    
    
    init() {
        self.controller = PdAudioController()
    }
    

    func start() {
        self.controller.isActive = true
    }
    
    func stop() {
        self.controller.isActive = false
    }
    
    
    
}
