//
//  ViewController.swift
//  basecoin-ios
//
//  Created by Adrian Brink on 24/07/2017.
//  Copyright © 2017 Adrian Brink. All rights reserved.
//

import Bindings
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        
        testFFI()
        testFS()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func testFS() {
        let directory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(directory)
        
        let client = BindingsNewClient()
        client?.setDirectoryPath(directory[0])
        
        print(client?.directoryPath())
    }
    
    private func testFFI() {
        let coin = BindingsGetCoin()
        print(coin?.amount())
        
        let account = BindingsGetAccount("1B1BE55F969F54064628A63B9559E7C21C925165", "empty")
        
        if (account?.error().isEmpty)! {
            print(account?.height())
            print(account?.key())
        } else {
            print(account?.error())
        }
    }


}

