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
    
    let label = UILabel()
    
    let radioButton1: LRadioButton = LRadioButton()
    
    let radioButton2: LRadioButton = LRadioButton()
    
    let radioButton3: LRadioButton = LRadioButton()
    
    let radioButton4: LRadioButton = LRadioButton()

    
    /// ラジオボタンを格納する配列
    var radioButtons:[LRadioButton] = [LRadioButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "選択されていません"
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 15).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        createRadioButton1()
        
        createRadioButton2()
        
        createRadioButton3()
        
        createRadioButton4()

        
        
     
        radioButtons.append(radioButton1)
        radioButtons.append(radioButton2)
        radioButtons.append(radioButton3)
        radioButtons.append(radioButton4)
    }
    
    
    func createRadioButton1() {
        radioButton1.setLRadioButton(title: "radioButton1", tag: 1)
        radioButton1.setLRadioView(lRadioViewSize: CGSize(width: 30, height: 30),
                                   color: .blue,
                                   margin: 15
        )
        radioButton1.delegate = self
        view.addSubview(radioButton1)
        radioButton1.translatesAutoresizingMaskIntoConstraints = false
        radioButton1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        radioButton1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        radioButton1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        radioButton1.heightAnchor.constraint(equalToConstant: radioButton1.height).isActive = true
    }
    
    func createRadioButton2() {
        radioButton2.setLRadioButton(title: "radioButton2", tag: 2)
        radioButton2.setLRadioView(lRadioViewSize: CGSize(width: 30, height: 30),
                                   color: .red,
                                   margin: 15
        )
        radioButton2.delegate = self
        view.addSubview(radioButton2)
        radioButton2.translatesAutoresizingMaskIntoConstraints = false
        radioButton2.topAnchor.constraint(equalTo: radioButton1.bottomAnchor, constant: 5).isActive = true
        radioButton2.leadingAnchor.constraint(equalTo: radioButton1.leadingAnchor).isActive = true
        radioButton2.trailingAnchor.constraint(equalTo: radioButton1.trailingAnchor).isActive = true
        radioButton2.heightAnchor.constraint(equalToConstant: radioButton2.height).isActive = true
    }
    
    func createRadioButton3() {
        radioButton3.setLRadioView(lRadioViewSize: CGSize(width: 30, height: 30),
                                   color: .orange,
                                   margin: 15
        )
        radioButton3.setTitle("radioButton3", for: .normal)
        radioButton3.tag = 3
        radioButton3.selectColor = .green
        radioButton3.delegate = self
        view.addSubview(radioButton3)
        radioButton3.translatesAutoresizingMaskIntoConstraints = false
        radioButton3.topAnchor.constraint(equalTo: radioButton2.bottomAnchor, constant: 5).isActive = true
        radioButton3.leadingAnchor.constraint(equalTo: radioButton1.leadingAnchor).isActive = true
        radioButton3.trailingAnchor.constraint(equalTo: radioButton1.trailingAnchor).isActive = true
        radioButton3.heightAnchor.constraint(equalToConstant: radioButton3.height).isActive = true
    }
    
    func createRadioButton4() {
        radioButton4.setLRadioButton(title: "radio\nButton\n4", tag: 4)
        radioButton4.setLRadioView(lRadioViewSize: CGSize(width: 30, height: 30),
                                   color: nil,
                                   margin: 15
        )
        radioButton4.delegate = self
        view.addSubview(radioButton4)
        radioButton4.translatesAutoresizingMaskIntoConstraints = false
        radioButton4.topAnchor.constraint(equalTo: radioButton3.bottomAnchor, constant: 5).isActive = true
        radioButton4.leadingAnchor.constraint(equalTo: radioButton1.leadingAnchor).isActive = true
        radioButton4.trailingAnchor.constraint(equalTo: radioButton1.trailingAnchor).isActive = true
        radioButton4.heightAnchor.constraint(equalToConstant: radioButton4.height).isActive = true
    }
    
    
    func didTapLRadioButton(radioButton: LRadioButton) {
        radioButtons.forEach { value in
            if radioButton.tag == value.tag {
                value.select()
                label.text = radioButton.text
            } else {
                value.deSelect()
            }
        }
    }

}
