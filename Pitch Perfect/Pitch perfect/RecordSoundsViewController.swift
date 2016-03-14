//
//  ViewController.swift
//  Pitch perfect
//
//  Created by Ishaan Mehra on 07/03/16.
//  Copyright © 2016 Ishaan Mehra. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController,AVAudioRecorderDelegate {
    //Declared Globally
    @IBOutlet weak var PressLabel: UILabel!
    var audioRecorder:AVAudioRecorder!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordingInProgress: UILabel!
    var recordAudio:RecordAudio!
    @IBOutlet weak var Recordingvoice: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        recordButton.enabled = true
        stopButton.hidden=true
        PressLabel.hidden=false
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
//tod:save the recorded audio
        if(flag)
        {
            recordAudio = RecordAudio(filePathUrl:recorder.url,title:recorder.url.lastPathComponent!)
            self.performSegueWithIdentifier("StopRecording", sender: recordAudio)        }
        else{
               print("rallah hu")
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier=="StopRecording"){
            let playSoundsVC:PlaySoundViewController = segue.destinationViewController as! PlaySoundViewController
            
            let data = sender as! RecordAudio
            playSoundsVC.recievedAudio=data
        }
    }
    
    @IBAction func Recordbutton(sender: UIButton) {
        PressLabel.hidden=true
        print("recording in progress")
        recordButton.enabled = false
        stopButton.hidden=false
        Recordingvoice.hidden=false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
       // let currentDateTime = NSDate()
        //let formatter = NSDateFormatter()
        //formatter.dateFormat = "ddMMyyyy-HHmmss"
        //let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        let recordingName = "recordvoice.wav"

        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
          print("hello")
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate=self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }

    @IBAction func Stopfunc(sender: UIButton) {
        print("inside stop")
        Recordingvoice.hidden=true
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
         print("inside stop recording")
    }
  
}

