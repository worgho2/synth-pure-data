//
//  ViewController.swift
//  SynthPD
//
//  Created by otavio on 10/12/20.
//

import UIKit
import libpd_ios

class ViewController: UIViewController {
    
    let pd = PdAudioController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let pdInit = pd?.configureAmbient(withSampleRate: 48000, numberChannels: 2, mixingEnabled: true) else {
            return
        }
        
        if pdInit != PdAudioOK {
            print("Falhou brow")
            return
        }
        
        PdBase.openFile("main.pd", path: Bundle.main.resourcePath)
        
        pd?.isActive = true
    }
    
    
    @IBAction func onSwtich(_ sender: UISwitch) {
        PdBase.send(sender.isOn ? 1 : 0, toReceiver: "onOff")
    }
    
    
    @IBAction func onSlider(_ sender: UISlider) {
        PdBase.send(sender.value, toReceiver: "xFade")
    }
}

