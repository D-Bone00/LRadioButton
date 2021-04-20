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
    
    
    var radioButton1: LRadioButton = LRadioButton(title: "radioButton1" ,
                                                  lRadioViewSize: CGSize(width: 30, height: 30),
                                                  color: .blue,
                                                  tag: 1
    )
    
    
    
    var radioButton2: LRadioButton = LRadioButton(title: "radioButton2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" ,
                                                  lRadioViewSize: CGSize(width: 30, height: 30),
                                                  color: .red,
                                                  tag: 2
    )
    
    
    
    
    
    let radioButton3: LRadioButton = LRadioButton(title: "radioButton3" ,
                                                  lRadioViewSize: CGSize(width: 30, height: 30),
                                                  color: .orange,
                                                  tag: 3
    )
    
    
    
    let radioButton4: LRadioButton = LRadioButton(title: "radioButton4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaa\na" ,
                                                  lRadioViewSize: CGSize(width: 30, height: 30),
                                                  color: nil,
                                                  tag: 4
    )

    
    
    /// ラジオボタンを格納する配列
    var radioButtons:[LRadioButton] = [LRadioButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        radioButton1.delegate = self
        view.addSubview(radioButton1)
        radioButton1.translatesAutoresizingMaskIntoConstraints = false
        radioButton1.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        radioButton1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        radioButton1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        radioButton1.heightAnchor.constraint(equalToConstant: radioButton1.height).isActive = true
        
        
        radioButton2.delegate = self
        view.addSubview(radioButton2)
        radioButton2.translatesAutoresizingMaskIntoConstraints = false
        radioButton2.topAnchor.constraint(equalTo: radioButton1.bottomAnchor, constant: 5).isActive = true
        radioButton2.leadingAnchor.constraint(equalTo: radioButton1.leadingAnchor).isActive = true
        radioButton2.trailingAnchor.constraint(equalTo: radioButton1.trailingAnchor).isActive = true
        radioButton2.heightAnchor.constraint(equalToConstant: radioButton2.height).isActive = true
        
        
        radioButton3.selectColor = .green
        radioButton3.delegate = self
        view.addSubview(radioButton3)
        radioButton3.translatesAutoresizingMaskIntoConstraints = false
        radioButton3.topAnchor.constraint(equalTo: radioButton2.bottomAnchor, constant: 5).isActive = true
        radioButton3.leadingAnchor.constraint(equalTo: radioButton1.leadingAnchor).isActive = true
        radioButton3.trailingAnchor.constraint(equalTo: radioButton1.trailingAnchor).isActive = true
        radioButton3.heightAnchor.constraint(equalToConstant: radioButton3.height).isActive = true
        
        radioButton4.delegate = self
        view.addSubview(radioButton4)
        radioButton4.translatesAutoresizingMaskIntoConstraints = false
        radioButton4.topAnchor.constraint(equalTo: radioButton3.bottomAnchor, constant: 5).isActive = true
        radioButton4.leadingAnchor.constraint(equalTo: radioButton1.leadingAnchor).isActive = true
        radioButton4.trailingAnchor.constraint(equalTo: radioButton1.trailingAnchor).isActive = true
        radioButton4.heightAnchor.constraint(equalToConstant: radioButton4.height).isActive = true

        
        
     
        radioButtons.append(radioButton1)
        radioButtons.append(radioButton2)
        radioButtons.append(radioButton3)
        radioButtons.append(radioButton4)
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
