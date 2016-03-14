//
//  PlaySoundViewController.swift
//  Pitch perfect
//
//  Created by Ishaan Mehra on 08/03/16.
//  Copyright © 2016 Ishaan Mehra. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!
var recievedAudio:RecordAudio!
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!


    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        if let filePath = NSBundle.mainBundle().pathForResource("movie_quote1", ofType: "mp3"){
            // To find file path url from file path
  //          let filePathUrl = NSURL.fileURLWithPath(filePath)
    //          print(filePathUrl)
//audioPlayer = try! AVAudioPlayer(contentsOfURL: filePathUrl,fileTypeHint: nil)
  //      audioPlayer.enableRate=true
    //    }
      //  else{
        //    print("the filePath is empty")
            
      //  }
        //to play hardcoded audio
         //    if let filePath = NSBundle.mainBundle().pathForResource("movie_quote1", ofType: "mp3"){
        // To find file path url from file path
         //         let filePathUrl = NSURL.fileURLWithPath(filePath)
           //       print(filePathUrl)
        //audioPlayer = try! AVAudioPlayer(contentsOfURL: filePathUrl)
         //    audioPlayer.enableRate=true
            //}
          //else{
            //print("the filePath is empty")
        
          //}
      
        audioPlayer = try! AVAudioPlayer(contentsOfURL: recievedAudio.filePathUrl)
        audioPlayer.enableRate=true
        audioEngine = AVAudioEngine()
        audioFile = try! AVAudioFile(forReading: recievedAudio.filePathUrl)
        
       
    
    }
   
 
    @IBAction func playChipmunk(sender: UIButton) {
          print("inside chipmunk")
        playAudioWithVariablePitch(1000.0)
     
    }

    @IBAction func playdarthvader(sender: UIButton) {
          playAudioWithVariablePitch(-1000.0)
    }
    
    func playAudioWithVariablePitch(pitch: Float){
           print("insiderror")
        audioPlayer.stop()
         audioEngine.reset()
        audioEngine.stop()
       
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        
        audioPlayerNode.play()
    }
    
    @IBAction func playSnail(sender: UIButton) {
        
            print("inside snail")
        audioEngine.reset()
        audioEngine.stop()
        audioPlayer.stop()
        audioPlayer.rate=0.5
        audioPlayer.currentTime=0.0
        audioPlayer.play()
    }
   
    @IBAction func playRabbit(sender: UIButton) {
          print("inside rabbit")
        audioEngine.reset()
        audioEngine.stop()
          audioPlayer.stop()
        audioPlayer.rate=1.9
        audioPlayer.currentTime=0.0
        audioPlayer.play()
    }
   
 
    @IBAction func Stopfunction(sender: UIButton) {
        audioPlayer.stop()
        audioEngine.reset()
        audioEngine.stop()
    }
   
 
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
