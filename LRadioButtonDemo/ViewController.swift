//
//  ViewController.swift
//  LRadioButtonDemo
//
//  Created by 土橋正晴 on 2019/10/10.
//  Copyright © 2019 m.dobashi. All rights reserved.
//

import UIKit
import LRadioButton


class ViewController: UIViewController, LRadioButtonDelegate {
    
    
    lazy var radioButton1: LRadioButton = {
        let radioButton: LRadioButton = LRadioButton(frame: .zero,
                                                     title: "radioButton1" ,
                                                     lRadioViewSize: CGSize(width: 30, height: 30),
                                                     color: .blue,
                                                     tag: 1
        )
        radioButton.delegate = self

        
        return radioButton
    }()
    
    
        lazy var radioButton2: LRadioButton = {
            let radioButton: LRadioButton = LRadioButton(frame: .zero,
                                                         title: "radioButton2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" ,
                                                         lRadioViewSize: CGSize(width: 30, height: 30),
                                                         color: .red,
                                                         tag: 2
            )
            radioButton.delegate = self
            
            return radioButton
        }()

    
    
          lazy var radioButton3: LRadioButton = {
            let radioButton: LRadioButton = LRadioButton(frame: .zero,
                                                           title: "radioButton3" ,
                                                           lRadioViewSize: CGSize(width: 30, height: 30),
                                                           color: .orange,
                                                           tag: 3
              )
              radioButton.delegate = self
              
              return radioButton
          }()
    
    lazy var radioButton4: LRadioButton = {
      let radioButton: LRadioButton = LRadioButton(frame: .zero,
                                                     title: "radioButton4" ,
                                                     lRadioViewSize: CGSize(width: 30, height: 30),
                                                     color: nil,
                                                     tag: 4
        )
        radioButton.delegate = self
        
        return radioButton
    }()
    
    
    /// ラジオボタンを格納する配列
    var radioButtons:[LRadioButton] = [LRadioButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        radioButton1.sizeToFit()
        view.addSubview(radioButton1)
        radioButton1.translatesAutoresizingMaskIntoConstraints = false
        radioButton1.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        radioButton1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        radioButton1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        radioButton1.heightAnchor.constraint(equalToConstant: radioButton1.frame.height).isActive = true
        
        
        radioButton2.sizeToFit()
        
        view.addSubview(radioButton2)
        radioButton2.translatesAutoresizingMaskIntoConstraints = false
        radioButton2.topAnchor.constraint(equalTo: radioButton1.bottomAnchor, constant: 5).isActive = true
        radioButton2.leadingAnchor.constraint(equalTo: radioButton1.leadingAnchor).isActive = true
        radioButton2.trailingAnchor.constraint(equalTo: radioButton1.trailingAnchor).isActive = true
        radioButton2.heightAnchor.constraint(equalToConstant: radioButton2.frame.height).isActive = true
        
        radioButton3.sizeToFit()
        view.addSubview(radioButton3)
        radioButton3.translatesAutoresizingMaskIntoConstraints = false
        radioButton3.topAnchor.constraint(equalTo: radioButton2.bottomAnchor, constant: 5).isActive = true
        radioButton3.leadingAnchor.constraint(equalTo: radioButton1.leadingAnchor).isActive = true
        radioButton3.trailingAnchor.constraint(equalTo: radioButton1.trailingAnchor).isActive = true
        radioButton3.heightAnchor.constraint(equalToConstant: radioButton3.frame.height).isActive = true
        
        radioButton4.sizeToFit()
        view.addSubview(radioButton4)
        radioButton4.translatesAutoresizingMaskIntoConstraints = false
        radioButton4.topAnchor.constraint(equalTo: radioButton3.bottomAnchor, constant: 5).isActive = true
        radioButton4.leadingAnchor.constraint(equalTo: radioButton1.leadingAnchor).isActive = true
        radioButton4.trailingAnchor.constraint(equalTo: radioButton1.trailingAnchor).isActive = true
        radioButton4.heightAnchor.constraint(equalToConstant: radioButton4.frame.height).isActive = true
        
        
        
     
        radioButtons.append(radioButton1)
        radioButtons.append(radioButton2)
        radioButtons.append(radioButton3)
        radioButtons.append(radioButton4)
    }

    
    
    @objc func test(radioButton: LRadioButton) {
        print("test")
    }
    
    
    
    
    func radioButtontapAction(radioButton: LRadioButton) {
        
        for i in 0..<radioButtons.count {
            if radioButton.tag == radioButtons[i].tag {
                radioButtons[i].select()
                print(String((radioButton.titleLabel?.text)!))
            } else {
                radioButtons[i].deSelect()
            }
        }
    }

}
