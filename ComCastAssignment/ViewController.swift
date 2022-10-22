//
//  ViewController.swift
//  ComCastAssignment
//
//  Created by Karthika on 10/21/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVPlayer?
    var printingNumber = 0.0
    @IBOutlet weak var btnPlay: UIButton!
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initPlayer()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnPress(sender: AnyObject) {
        if (btnPlay.titleLabel?.text == "Play") {
            initPlayer()
            btnPlay.setTitle("Stop", for: .normal)
        } else {
            stopPlayer()
            btnPlay.setTitle("Play", for: .normal)
        }
    }
    
    func initPlayer()  {
        if let play = player {
            print("playing")
            play.play()
            printNumbers(printing: true)
        } else {
            player = AVPlayer(url: NSURL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_4x3/bipbop_4x3_variant.m3u8")! as URL)
            print("playing")
            player!.play()
            printNumbers(printing: true)
        }
    }
    
    func stopPlayer() {
        if let play = player {
            print("stopped")
            play.pause()
            player = nil
            printNumbers(printing: false)
        }
    }
    
    func printNumbers(printing: Bool) {
        if printing {
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                self.printingNumber += 0.5
                print(self.printingNumber)
            }
        } else {
            timer?.invalidate()
            self.printingNumber = 0.0
        }
    }
    
}

