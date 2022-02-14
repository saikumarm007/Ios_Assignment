//
//  ViewController.swift
//  Vemula_Calculator
//
//  Created by Vemula,Ajay Kumar on 2/13/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    var previousNumber=""
    var currentNumber=""
    var result=""
    var op=""
    var opChanged = false
    var currentNumber2 = ""
    var inChain = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func AC(_ sender: UIButton) {
        clearAll()
                currentNumber = ""
                           previousNumber = ""
                           opChanged = false
                           op = ""
                           currentNumber2 = ""
                           displayLabel.text = "0"
                           displayLabel.textColor = .red
                           inChain = false
    }
    
    @IBAction func C(_ sender: UIButton) {
        currentNumber = ""
                       displayLabel.text = ""
    }
    
    @IBAction func SignChange(_ sender: UIButton) {
        if previousNumber != "" {
                              
                              displayLabel.text = "-" + displayLabel.text!
                              previousNumber = "\(displayLabel.text!)"
                              
                              print("number 1 is \(previousNumber)")
                              print("number 2 is \(currentNumber)")
                          }
                          else{
                              displayLabel.text = "-" + displayLabel.text!
                              currentNumber = "\(displayLabel.text!)"
                              print("number 1 is \(previousNumber)")
                              print("number 2 is \(currentNumber)")
                          }
    }
    
    @IBAction func Division(_ sender: UIButton) {
        let temp = calculate(op)
                          op = "/"
                          displayLabel.text = (temp != "") ? resultFormatter(temp) : ""
                          if temp != "" {
                              if currentNumber != ""{
                                  inChain = true
                                  if opChanged {
                                      result = String(Double(temp)! / Double(currentNumber)!)
                                      print(result)
                                      if result == "inf"{
                                          displayLabel.text! = "Error"
                                      }else{
                                          displayLabel.text! = resultFormatter(result)
                                      }
                                  }
                              }
                          }
                          opChanged = true
    }
    
    @IBAction func Seven(_ sender: UIButton) {
        setData("7")
    }
    
    @IBAction func Eight(_ sender: UIButton) {
        setData("8")
    }
    
    @IBAction func Nine(_ sender: UIButton) {
        setData("9")
    }
    
   
    @IBAction func Multiplication(_ sender: UIButton) {
        let temp = calculate(op)
                         print("temp is \(temp)")
                         op = "*"
                         currentNumber2=""
                         displayLabel.text = (temp != "") ? resultFormatter(temp) : ""
                         opChanged=true
                     }
                     
                     @IBAction func MinusButton(_ sender: UIButton) {
                         let temp = calculate(op)
                         op = "-"
                         displayLabel.text = (temp != "") ? resultFormatter(temp) : ""
                         if temp != ""
                         {
                             if currentNumber != ""
                             {
                                 inChain = true
                                 currentNumber2 = currentNumber;
                                 if opChanged
                                 {
                                     result = String(Double(temp)! - Double(currentNumber)!)
                                     displayLabel.text! = resultFormatter(result)
                                 }
                             }
                         }
                         opChanged = true
    }
    
    @IBAction func Four(_ sender: UIButton) {
        setData("4")
    }
    
    @IBAction func Five(_ sender: UIButton) {
        setData("5")
    }
    
    
    @IBAction func Six(_ sender: UIButton) {
        setData("6")
    }
    
    
    @IBAction func Sub(_ sender: UIButton) {
        let temp = calculate(op)
                         op = "-"
                         displayLabel.text = (temp != "") ? resultFormatter(temp) : ""
                         if temp != ""
                         {
                             if currentNumber != ""
                             {
                                 inChain = true
                                 currentNumber2 = currentNumber;
                                 if opChanged
                                 {
                                     result = String(Double(temp)! - Double(currentNumber)!)
                                     displayLabel.text! = resultFormatter(result)
                                 }
                             }
                         }
                         opChanged = true
    }
    
    
    @IBAction func One(_ sender: UIButton) {
        setData("1")
    }
    
    
    @IBAction func Two(_ sender: UIButton) {
        setData("2")
    }
    
    
    @IBAction func Three(_ sender: UIButton) {
        setData("3")
    }
    
    @IBAction func Plus(_ sender: UIButton) {
        let temp = calculate(op)
                          print("temp value is \(temp)")
                          op = "+"
                          currentNumber2=""
                          displayLabel.text = (temp != "") ? resultFormatter(temp) : ""
                          opChanged=true
    }
    
    
    @IBAction func Zero(_ sender: UIButton) {
        setData("0")
    }
    
    @IBAction func Dot(_ sender: UIButton) {
        setData(".")
    }
    
    
    @IBAction func Modulus(_ sender: UIButton) {
        let temp = calculate(op)
                          op = "%"
                          displayLabel.text = (temp != "") ? resultFormatter(temp) : ""
                          if temp != "" {
                              if currentNumber != ""{
                                  inChain = true
                                  if opChanged {
                                      result = String(Double(temp)! / Double(currentNumber)!)
                                      print(result)
                                      if result == "inf"{
                                          displayLabel.text! = "Error"
                                      }else{
                                          displayLabel.text! = resultFormatter(result)
                                      }
                                  }
                              }
                          }
                          opChanged = true
    }
    
    @IBAction func Equal(_ sender: UIButton) {
        var res = ""
                          switch op {
                          case "+":
                              if currentNumber2 != ""
                              {
                                  res = String(Double(previousNumber)! + Double(currentNumber2)!)
                                  displayLabel.text = resultFormatter(res)
                                   currentNumber = currentNumber2
                              }
                              else
                              {
                                  res = String(Double(previousNumber)! + Double(currentNumber)!)
                                  displayLabel.text = resultFormatter(res)
                              }
                              previousNumber = res
                              break
                          case "*":
                              if currentNumber2 != ""
                              {
                                  res = String(Double(previousNumber)! * Double(currentNumber2)!)
                                  displayLabel.text = resultFormatter(res)
                              }
                              else
                              {
                                  res = String(Double(previousNumber)! * Double(currentNumber)!)
                                  displayLabel.text = resultFormatter(res)
                              }
                              previousNumber = res
                              break
                          case "-":
                              if currentNumber2 != ""
                              {
                                  res = String(Double(previousNumber)! - Double(currentNumber2)!)
                                  displayLabel.text = resultFormatter(res)
                              }
                              else
                              {
                                  res = String(Double(previousNumber)! - Double(currentNumber)!)
                                  displayLabel.text = resultFormatter(res)
                              }
                              previousNumber = res
                              break
                          case "/":
                              if displayLabel.text == "Error"
                              {
                                  clearAll()
                              }else{
                                  if currentNumber2 != ""
                                  {
                                      res = String(Double(previousNumber)! / Double(currentNumber2)!)
                                      if res == "inf"
                                      {
                                          displayLabel.text! = "Error"
                                          return
                                      }
                                      else
                                      {
                                          displayLabel.text = resultFormatter(res)
                                      }
                                  }
                                  else
                                  {
                                      res = String(Double(previousNumber)! / Double(currentNumber)!)
                                      if res == "inf"
                                      {
                                          displayLabel.text! = "Error"
                                          return
                                      }
                                      else
                                      {
                                          displayLabel.text = resultFormatter(res)
                                      }
                                  }
                                  previousNumber = res
                              }
                              break
                          default:
                              print("Nothing")
                          }
    }
    func clearAll(){
            currentNumber = ""
            previousNumber = ""
            opChanged = false
            op = ""
            currentNumber2 = ""
            displayLabel.text = "0"
            displayLabel.textColor = .red
            inChain=false
         }
                  
       func setData(_ number: String){
            if displayLabel.text == "0"{
                 displayLabel.text = ""
                 displayLabel.textColor = .white
            }
                    
             if !opChanged {
                displayLabel.text! += number
                previousNumber += number
               }
               else
               {
               print(inChain)
              if !inChain
                {
                displayLabel.text! += number
                currentNumber += number
                 }
                else
                {
                 displayLabel.text = ""
                 displayLabel.text! += number
                 currentNumber += number
                 }
              }
         }
                  
       func calculate(_ operation:String)->String {
          print("\(previousNumber),\(currentNumber)")
          if previousNumber != "" && currentNumber != ""{
            if operation == "+"
              {
                 previousNumber = String(Double(previousNumber)! + Double(currentNumber)!)
                 currentNumber2 = currentNumber
                 currentNumber = ""
                 return String(previousNumber)
               }
              if operation == "-"
               {
                previousNumber = String(Double(previousNumber)! - Double(currentNumber)!)
                currentNumber2 = currentNumber
                currentNumber = ""
                return String(previousNumber)
               }
               if operation == "*"
               {
                previousNumber = String(Double(previousNumber)! * Double(currentNumber)!)
                currentNumber2 = currentNumber
                currentNumber = ""
                return String(previousNumber)
                }
                if operation == "/"
                {
                 previousNumber = String(Double(previousNumber)! / Double(currentNumber)!)
                 currentNumber2 = currentNumber
                 currentNumber = ""
                 return String(previousNumber)
                }
              if operation == "%"
              {
               previousNumber = String(Double(previousNumber)! / Double(currentNumber)!)
                  
               currentNumber2 = currentNumber
               currentNumber = ""
               return String(previousNumber)
              }
          }
           return ""
       }
           func resultFormatter(_ result:String)->String {
                 let value = Double(result)!
                 var res = String(round(value * 100000) / 100000.0)
                 if res.contains(".0")
                 {
                  res.removeSubrange(res.index(res.endIndex, offsetBy: -2)..<res.endIndex)
                 }
                  return res
               }
}

