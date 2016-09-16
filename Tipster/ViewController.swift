//
//  ViewController.swift
//  Tipster
//
//  Created by Lucas Hendren on 9/14/16.
//  Copyright © 2016 Lucas Hendren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var sliderField: UISlider!
    @IBOutlet weak var numberPeopleSeg: UISegmentedControl!
    @IBOutlet weak var onePerson: UILabel!
    @IBOutlet weak var twoPerson: UILabel!
    @IBOutlet weak var threePerson: UILabel!
    @IBOutlet weak var fourPerson: UILabel!
    @IBOutlet weak var tipPerLabel: UILabel!
    
    
    @IBOutlet weak var numPeopleTitle: UILabel!
    @IBOutlet weak var totalTitleLabel: UILabel!
    @IBOutlet weak var barrierView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("load")
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        let defaults = NSUserDefaults.standardUserDefaults()

        let doubleValue = defaults.doubleForKey("key2") ?? 0
        print(doubleValue)

        if doubleValue < 0.40{
            sliderField.maximumValue=0.40
            sliderField.minimumValue=0

        }
        else{
            sliderField.maximumValue=Float(doubleValue) * 2
            sliderField.minimumValue=0
        }
            sliderField.value=Float(doubleValue)
            tipPerLabel.text="%"+String(format: "%.2f", Float(doubleValue) )
        
        numberPeopleSeg.selectedSegmentIndex=0
        
        onePerson.text=formatter.stringFromNumber(0)
        twoPerson.text=formatter.stringFromNumber(0)
        threePerson.text=formatter.stringFromNumber(0)
        fourPerson.text=formatter.stringFromNumber(0)
        tipLabel.text=formatter.stringFromNumber(0)

        totalLabel.text=formatter.stringFromNumber(0)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        super.viewDidLoad()
        print("load")
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let doubleValue = defaults.doubleForKey("key2") ?? 0
        
        print(doubleValue)
        if doubleValue < 0.40{
            sliderField.maximumValue=0.40
            sliderField.minimumValue=0
            
        }
        else{
            sliderField.maximumValue=Float(doubleValue) * 2
            sliderField.minimumValue=0
        }
        sliderField.value=Float(doubleValue)
        tipPerLabel.text="%"+String(format: "%.2f", Float(doubleValue) )
        
        numberPeopleSeg.selectedSegmentIndex=0
        
        onePerson.text=formatter.stringFromNumber(0)
        twoPerson.text=formatter.stringFromNumber(0)
        threePerson.text=formatter.stringFromNumber(0)
        fourPerson.text=formatter.stringFromNumber(0)
        tipLabel.text=formatter.stringFromNumber(0)
        
        totalLabel.text=formatter.stringFromNumber(0)
        
        
        print("view will appear")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
    @IBAction func calculateTip(sender: AnyObject) {
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        
        
        tipPerLabel.text="%"+String(format: "%.2f", sliderField.value*100 )
        let tipPercentages=Double(sliderField.value)
        let bill = Double(billField.text!) ?? 0
        let tip = bill*tipPercentages
        let total = bill+tip
        tipLabel.text=formatter.stringFromNumber(tip)
        onePerson.text=formatter.stringFromNumber(total)
        twoPerson.text=formatter.stringFromNumber(total/2)
        threePerson.text=formatter.stringFromNumber(total/3)
        fourPerson.text=formatter.stringFromNumber(total/4)

        let peopleTotals=[total,total/2,total/3,total/4]
        totalLabel.text=formatter.stringFromNumber(peopleTotals[numberPeopleSeg.selectedSegmentIndex] )

    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self);
    }
    
    
    func keyboardWillShow(notification: NSNotification) {
        print("keyboard1")
            let yTwo=barrierView.frame.origin.y
            let y=totalTitleLabel.frame.origin.y
            totalTitleLabel.frame.origin.y=numPeopleTitle.frame.origin.y+20
            totalLabel.frame.origin.y=numPeopleTitle.frame.origin.y+20
        
            numPeopleTitle.frame.origin.y=y+10

            barrierView.frame.origin.y=numberPeopleSeg.frame.origin.y+31
            numberPeopleSeg.frame.origin.y=yTwo+10
        
    }
    func keyboardWillHide(notification: NSNotification) {
        print("keyboard2")

        let yTwo=barrierView.frame.origin.y-31
        let y=totalTitleLabel.frame.origin.y-20
        totalTitleLabel.frame.origin.y=numPeopleTitle.frame.origin.y-10
        totalLabel.frame.origin.y=numPeopleTitle.frame.origin.y-10
        
        numPeopleTitle.frame.origin.y=y
        
        barrierView.frame.origin.y=numberPeopleSeg.frame.origin.y-10
        numberPeopleSeg.frame.origin.y=yTwo
        
        
        
    }
}

