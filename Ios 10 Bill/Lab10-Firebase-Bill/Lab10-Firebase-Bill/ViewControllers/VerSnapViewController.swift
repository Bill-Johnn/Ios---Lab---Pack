//
//  VerSnapViewController.swift
//  Lab10-Firebase-Bill
//
//  Created by MAC01 on 28/05/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase
import AVFoundation

class VerSnapViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var btnAudio: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelAudio: UILabel!
    var snap = Snap()
    
    var audioRecorder:AVAudioRecorder?
   // var audioPlayer:AVAudioPlayer?
    var audioURL:URL?
    var audioPlayer:AVPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text? = snap.descrip
        labelAudio.text? = snap.descripAudio
        imageView.sd_setImage(with: URL(string: snap.imagenURL))
        
        setupRecorder()
        if(String(snap.imagenURL).contains("imagenes")){
            btnAudio.isHidden = true
            label.text? = snap.descrip
            imageView.sd_setImage(with: URL(string:snap.imagenURL))
            
        }// Do any additional setup after loading the view.
        else{
            label.text? = snap.descrip
            
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        Database.database().reference().child("usuarios").child((Auth.auth().currentUser?.uid)!).child("snaps").child(snap.id).removeValue()
        
        Storage.storage().reference().child("imagenes").child("\(snap.imagenID).jpg").child("audios").child("\(snap.audioID).m4a").delete {(error) in
        print("Se elimino la imagen correctamente")
    }
}
    @IBAction func AudioTapped(_ sender: Any) {
        do{
            try audioPlayer = AVPlayer(url: URL(string:snap.audioURL)!)
            audioPlayer!.play()
        }catch{
            print("no se pudo reproducir::::\(snap.audioURL)")
        }    }
    func setupRecorder(){
        do{
            let session  = AVAudioSession.sharedInstance();
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try session.overrideOutputAudioPort(.speaker)
            try session.setActive(true)
            
            let basePath:String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let pathComponents = [basePath,"audio.m4a"]
            audioURL = NSURL.fileURL(withPathComponents: pathComponents)!
            
            
            
            print("****************");
            print(audioURL!);
            print("****************")
            
            var settings:[String:AnyObject] = [:]
            settings[AVFormatIDKey] = Int(kAudioFormatMPEG4AAC) as AnyObject?
            settings[AVSampleRateKey] = 44100.0 as AnyObject?
            settings[AVNumberOfChannelsKey] = 2 as AnyObject?
            
            audioRecorder = try AVAudioRecorder(url: audioURL!, settings: settings)
            audioRecorder!.prepareToRecord()
            
        }
        catch let error as NSError{
            print (error)
        }
    }
}
