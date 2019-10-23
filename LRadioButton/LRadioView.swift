//
//  LRadioView.swift
//  LRadioButton
//
//  Created by 土橋正晴 on 2019/10/23.
//  Copyright © 2019 m.dobashi. All rights reserved.
//

import Foundation
import UIKit

// MARK: - LRadioView

/// 選択状態を表すためのビュー
public class LRadioView: UIView {
    
    
    public override var frame: CGRect {
        didSet {
            inView.frame.size = CGSize(width: frame.size.width - 10, height: frame.size.height - 10)
            inView.layer.cornerRadius = inView.frame.height / 2
        }
    }
    
    
    /// 選択された時にbackgroundColorを塗りつぶしたりする部分
    public lazy var inView: UIView = {
        let view: UIView = UIView()
        view.alpha = 0
        
        return view
    }()
    
    
    // MARK: Init
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    public convenience init(size: CGSize, color: UIColor? = nil) {
        self.init()
        self.frame.size = size
        
        layer.borderWidth = 1
        layer.cornerRadius = frame.size.height / 2
        layer.borderColor = color != nil ? color?.cgColor : UIColor.black.cgColor
        isUserInteractionEnabled = false
        
        inView.backgroundColor =  color != nil ? color : UIColor.black
        inViewConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Constraint
    
    /// inViewの制約
    public func inViewConstraint() {
        addSubview(inView)
        inView.translatesAutoresizingMaskIntoConstraints = false
        inView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        inView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        inView.widthAnchor.constraint(equalToConstant: inView.frame.height).isActive = true
        inView.heightAnchor.constraint(equalToConstant: inView.frame.height).isActive = true
        
    }
    
    
    
    // MARK: Select, Deselect
    
    /// inViewの背景色を表示する
    ///
    /// inViewにbackgroundColorを設定し、alphaを1にする
    public func selectView() {
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.inView.alpha = 1
        }
    }
    
    /// inViewの背景色を非表示にする
    ///
    /// inViewのalphaを0にする
    public func deselectView() {
        
        UIView.animate(withDuration: 0.1) { [weak self] in
            self?.inView.alpha = 0
        }
    }
}
