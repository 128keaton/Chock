//
//  MicTest.swift
//  Chock
//
//  Created by Keaton Burleson on 10/21/16.
//  Copyright © 2016 Keaton Burleson. All rights reserved.
//

import Foundation
import UIKit
import EZAudio

class MicTest: UIViewController, EZMicrophoneDelegate {
	@IBOutlet var audioPlot: EZAudioPlot?
	var microphone: EZMicrophone?
	var inputs: [EZAudioDevice]?
	
	
	override func viewDidLoad() {
		let session = AVAudioSession.sharedInstance()
		try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
		try! session.setActive(true)
		audioPlot?.plotType = EZPlotType.rolling
		audioPlot?.shouldMirror = true
		audioPlot?.shouldFill = true
		microphone = EZMicrophone.init(microphoneDelegate: self)
		inputs = EZAudioDevice.inputDevices() as! [EZAudioDevice]?
		microphone?.startFetchingAudio()
	}
	
	
	func microphone(_ microphone: EZMicrophone!, hasAudioReceived buffer: UnsafeMutablePointer<UnsafeMutablePointer<Float>?>!, withBufferSize bufferSize: UInt32, withNumberOfChannels numberOfChannels: UInt32) {
		DispatchQueue.main.async {
			self.audioPlot?.updateBuffer(buffer[0], withBufferSize: bufferSize)
		}
	}
	
}
