//
//  ViewController.swift
//  CallingDemo
//
//  Created by Anup D'Souza on 27/06/24.
//  🕸️ https://www.anupdsouza.com
//  🔗 https://twitter.com/swift_odyssey
//  👨🏻‍💻 https://github.com/anupdsouza
//  ☕️ https://www.buymeacoffee.com/anupdsouza
//

import UIKit
import ZegoUIKit
import ZegoUIKitPrebuiltCall

class ViewController: UIViewController {
    
    private var userID: String = String(format: "zego_user_id_%d", Int.random(in: 0...1000))
    private var callID: String = "1000"
    private var appID: UInt32 = 123456
    private var appSign = "123456123456123456123456"
    @IBOutlet private var usernameField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func makeNewCall(_ sender: Any) {
        
        usernameField.resignFirstResponder()
        
        guard let username = usernameField.text else {
            print("Username not provided")
            return
        }
        
        // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
        let config: ZegoUIKitPrebuiltCallConfig = ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        
        let callVC = ZegoUIKitPrebuiltCallVC.init(appID,
                                                  appSign: appSign,
                                                  userID: self.userID,
                                                  userName: username,
                                                  callID: self.callID,
                                                  config: config)
        callVC.modalPresentationStyle = .fullScreen
        self.present(callVC, animated: true, completion: nil)
    }

}
