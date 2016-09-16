//
//  SettingViewController.swift
//  Tipster
//
//  Created by Lucas Hendren on 9/15/16.
//  Copyright © 2016 Lucas Hendren. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var tipField: UITextField!

    @IBAction func newDefault(sender: AnyObject) {
        print("creating default")
        let defaults = NSUserDefaults.standardUserDefaults()
        var tip=Double(tipField.text!) ?? 0
        tip=tip/100
        defaults.setObject("default tip", forKey: "key1")
        defaults.setDouble(tip, forKey: "key2")
        defaults.synchronize()

    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        print("creating default")
        let defaults = NSUserDefaults.standardUserDefaults()
        var tip=Double(tipField.text!) ?? 0
        tip=tip/100
        defaults.setObject("default tip", forKey: "key1")
        defaults.setDouble(tip, forKey: "key2")
        defaults.synchronize()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        let doubleValue = defaults.doubleForKey("key2") ?? 0
        tipField.text=String(doubleValue)

        // Do any additional setup after loading the view.
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
