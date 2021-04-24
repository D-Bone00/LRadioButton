//
//  LRadioView.swift
//  LRadioButton
//
//  Created by 土橋正晴 on 2019/10/23.
//  Copyright © 2019 m.dobashi. All rights reserved.
//

import UIKit

// MARK: - LRadioView

/// 選択状態を表すためのビュー
public class LRadioView: UIView {
    
    /// 選択された時にbackgroundColorを塗りつぶしたりする部分
    public var inView: UIView = {
        let view: UIView = UIView()
        view.alpha = 0
        
        return view
    }()
    
    
    /// - get: このビューのframe.sizeを取得する
    /// - set: frame.sizeの設定とcornerRadiusを設定する
    public var size: CGSize {
        get { self.frame.size }
        
        set {
            self.frame.size = newValue
            self.layer.cornerRadius = newValue.height / 2
        }
    }
    
    
    /// borderColorと選択時の●の背景色を設定する
    public var color: UIColor? {
        didSet {
            layer.borderColor = color != nil ? color?.cgColor : UIColor.black.cgColor
            inView.backgroundColor = color != nil ? color : UIColor.black
        }
    }
    
    // MARK: Init
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 1
        isUserInteractionEnabled = false
        addSubview(inView)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Constraint
    
    /// inViewの制約
    public func inViewConstraint() {
        inView.translatesAutoresizingMaskIntoConstraints = false
        inView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        inView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        inView.widthAnchor.constraint(equalToConstant: size.width - 10).isActive = true
        inView.heightAnchor.constraint(equalToConstant: size.height - 10).isActive = true
        inView.layer.cornerRadius = (size.height - 10) / 2
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
