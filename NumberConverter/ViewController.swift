//
//  ViewController.swift
//  NumberConverter
//
//  Created by John Carden on 6/25/18.
//  Copyright © 2018 John Carden. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var welcomeMessage: UILabel!
    @IBOutlet weak var incrementView: UIStepper!
    @IBOutlet weak var resetBtnView: UIButton!
    @IBOutlet weak var displayTitle: UILabel!
    @IBOutlet weak var welcomeBtn: UIButton!
    @IBOutlet weak var Oct: UILabel!
    @IBOutlet weak var Hex: UILabel!
    @IBOutlet weak var Bin: UILabel!
    @IBOutlet weak var Dec: UILabel!
    @IBOutlet weak var octLabel: UILabel!
    @IBOutlet weak var hexLabel: UILabel!
    @IBOutlet weak var decLabel: UILabel!
    @IBOutlet weak var binLabel: UILabel!
    @IBOutlet weak var currentInput: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    var BaseConverter: baseConverter!
    var oldValue: Double = 0
    @IBOutlet weak var segControl: UISegmentedControl!
    @IBOutlet weak var displayPicker: UIPickerView!
    var displayType = ["Binary", "Octal", "Hexadecimal", "Decimal", "all four bases"]
    
    
    @IBOutlet weak var image: UIImageView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return displayType.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return displayType[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let numberIn = baseConverter(currentInput.text!)
        clearOutputs()
        switch displayType[row]{
        case "Binary":
            
            if segmentedControlChoiceCheck(){
            hideEverything()
                 switch segControl.selectedSegmentIndex{
                 case 0: if currentInput.text == ""{}else{binLabel.text = currentInput.text}
                 case 1: binLabel.text = numberIn.hexToBin()
                 case 2: binLabel.text = numberIn.octToBin()
                 case 3: binLabel.text = numberIn.decimalToBin()
                 default: var _ = "nothing"}
            Bin.isHidden = false
            binLabel.isHidden = false
            }
        case "Hexadecimal":
            
            if segmentedControlChoiceCheck(){
            hideEverything()
                
                switch segControl.selectedSegmentIndex{
                case 0: hexLabel.text = numberIn.binToHex()
                case 1: if currentInput.text == ""{}else{hexLabel.text = currentInput.text}
                case 2: hexLabel.text = numberIn.octToHex()
                case 3: hexLabel.text = numberIn.decimalToHex()
                default: var _ = "nothing"}
                
            Hex.isHidden = false
            hexLabel.isHidden = false}
        case "Octal":
            
            if segmentedControlChoiceCheck(){
            hideEverything()
                
                switch segControl.selectedSegmentIndex{
                case 0: octLabel.text = numberIn.binToOct()
                case 1: octLabel.text = numberIn.hexToOct()
                case 2: if currentInput.text == ""{}else{octLabel.text = currentInput.text}
                case 3: octLabel.text = numberIn.decimalToOct()
                default: var _ = "nothing"}
                
            Oct.isHidden = false
            octLabel.isHidden = false
            }
        case "Decimal":
            
            if segmentedControlChoiceCheck(){
            hideEverything()
                
                switch segControl.selectedSegmentIndex{
                    case 0: decLabel.text = numberIn.binToDecimal()
                    case 1: decLabel.text = numberIn.hexToDecimal()
                    case 2: decLabel.text = numberIn.octToDecimal()
                    case 3: if currentInput.text == ""{}else{decLabel.text = currentInput.text}
                default: var _ = "nothing"}
                
                Dec.isHidden = false
                decLabel.isHidden = false}
        case "all four bases":
            
            if segmentedControlChoiceCheck(){
                
                switch segControl.selectedSegmentIndex{
                case 0:
                    if currentInput.text == ""{}else{binLabel.text = currentInput.text}
                    octLabel.text = numberIn.binToOct()
                    hexLabel.text = numberIn.binToHex()
                    decLabel.text = numberIn.binToDecimal()
                case 1:
                    binLabel.text = numberIn.hexToBin()
                    octLabel.text = numberIn.hexToOct()
                    if currentInput.text == ""{}else{hexLabel.text = currentInput.text}
                    decLabel.text = numberIn.hexToDecimal()
                case 2:
                    binLabel.text = numberIn.octToBin()
                    if currentInput.text == ""{}else{octLabel.text = currentInput.text}
                    hexLabel.text = numberIn.octToHex()
                    decLabel.text = numberIn.octToDecimal()
                case 3:
                    binLabel.text = numberIn.decimalToBin()
                    octLabel.text = numberIn.decimalToOct()
                    hexLabel.text = numberIn.decimalToHex()
                    if currentInput.text == ""{}else{decLabel.text = currentInput.text}
                default:
                    var _ = "nothing"
                }
                
            Bin.isHidden = false
            binLabel.isHidden = false
            Hex.isHidden = false
            hexLabel.isHidden = false
            Oct.isHidden = false
            octLabel.isHidden = false
            Dec.isHidden = false
            decLabel.isHidden = false}
        default:
            errorMessage.isHidden = true
        }
    }
    
    func segmentedControlChoiceCheck() -> Bool{
        let numberIn = baseConverter(currentInput.text!)
        switch segControl.selectedSegmentIndex{
        case 0:
            if numberIn.errorCheckerBin(){
                errorMessage.isHidden = true
                return true
                }else{
                hideEverything()
                errorMessage.isHidden = false
                return false}
        case 1:
            if numberIn.errorCheckerHex(){
                errorMessage.isHidden = true
                return true
                }else{
                hideEverything()
                errorMessage.isHidden = false
                return false}
        case 2:
            if numberIn.errorCheckerOct(){
                errorMessage.isHidden = true
                return true
                }else{
                hideEverything()
                errorMessage.isHidden = false
                return false}
        case 3:
            if numberIn.errorCheckerDec(){
                errorMessage.isHidden = true
                return true
                }else{
                hideEverything()
                errorMessage.isHidden = false
                return false}
        default:
            errorMessage.isHidden = true
            return true
            }
    }
    
    

    @IBAction func calcValue(_ sender: UIButton) {
    
    }
    
    
    @IBAction func numStepper(_ sender: UIStepper) {
        let numberIn = baseConverter(currentInput.text!)
        
        switch segControl.selectedSegmentIndex{
        case 0:
            if segmentedControlChoiceCheck(){
            var x = Int(numberIn.binToDecimal())!
            if incrementView.value > oldValue{
                x += 1
                oldValue = incrementView.value
            }else{
                x -= 1
                oldValue = incrementView.value
            }
            let y = baseConverter("\(x)")
                currentInput.text = y.decimalToBin()}
        case 1:
            if segmentedControlChoiceCheck(){
            var x = Int(numberIn.hexToDecimal())!
            if incrementView.value > oldValue{
                x += 1
                oldValue = incrementView.value
            }else{
                x -= 1
                oldValue = incrementView.value
            }
            let y = baseConverter("\(x)")
                currentInput.text = y.decimalToHex()}
        case 2:
            if segmentedControlChoiceCheck(){
                var x = Int(numberIn.octToDecimal())!
                if incrementView.value > oldValue{
                    x += 1
                    oldValue = incrementView.value
                }else{
                    x -= 1
                    oldValue = incrementView.value
                }
                let y = baseConverter("\(x)")
                currentInput.text = y.decimalToOct()}
        case 3:
            if segmentedControlChoiceCheck(){
            if incrementView.value > oldValue{
                currentInput.text = "\(Int(currentInput.text!)! + 1)"
                oldValue = incrementView.value
            }else{
                currentInput.text = "\(Int(currentInput.text!)! - 1)"
                oldValue = incrementView.value
                }}
        default: var _ = "nothing"}    }
    
    @IBAction func welcomeButton(_ sender: UIButton) {
        welcomeBtn.isHidden = true
        welcomeMessage.isHidden = true
        showFromWelcome()
        errorMessage.isHidden = true
        image.isHidden = true
    }
    
    @IBAction func resetBtn(_ sender: UIButton) {
        hideForWelcome()
        clearOutputs()
        currentInput.text! = ""
        welcomeBtn.isHidden = false
        welcomeMessage.isHidden = false
        image.isHidden = false
        oldValue = 0
        incrementView.value = 0
        
        //let imageView = UIImage(named: "BinaryImg")!
       
        //let alert = UIAlertController(title: "Number Converter", message: "Welcome! Select continue to enter the application.", preferredStyle: .alert)
        //alert.addImage(image: imageView)
        //self.present(alert, animated: true, completion: nil)
        //alert.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: nil))
    }
    
    func clearOutputs(){
        octLabel.text = "0"
        binLabel.text = "0"
        hexLabel.text = "0"
        decLabel.text = "0"
    }
    
    func hideEverything(){
        Oct.isHidden = true
        Hex.isHidden = true
        Bin.isHidden = true
        Dec.isHidden = true
        octLabel.isHidden = true
        hexLabel.isHidden = true
        binLabel.isHidden = true
        decLabel.isHidden = true
        errorMessage.isHidden = true    }
    
    func showFromWelcome(){
        errorMessage.isHidden = false
        incrementView.isHidden = false
        resetBtnView.isHidden = false
        currentInput.isHidden = false
        segControl.isHidden = false
        displayPicker.isHidden = false
        displayTitle.isHidden = false    }
    
    
    func hideForWelcome(){
        
        Oct.isHidden = true
        Hex.isHidden = true
        Bin.isHidden = true
        Dec.isHidden = true
        octLabel.isHidden = true
        hexLabel.isHidden = true
        binLabel.isHidden = true
        decLabel.isHidden = true
        errorMessage.isHidden = true
        incrementView.isHidden = true
        resetBtnView.isHidden = true
        currentInput.isHidden = true
        segControl.isHidden = true
        displayPicker.isHidden = true
        displayTitle.isHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let imageView = UIImageView(frame: CGRect(x: 220, y: 10, width: 40, height: 40))
        //imageView.image = #imageLiteral(resourceName: "BinaryImg.jpeg")
        //let alert = UIAlertController(title: "Number Converter", message: "Welcome! Select continue to enter the application.", preferredStyle: .alert)
        //alert.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: nil))
        //alert.view.addSubview(imageView)
        hideForWelcome()
        //welcomeBtn.isHidden = false
        //welcomeMessage.isHidden = false        //hideEverything()
        self.displayPicker.delegate = self
        self.displayPicker.dataSource = self
        //self.present(alert, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

