//
//  LRadioButton.swift
//  LRadioButton
//
//  Created by 土橋正晴 on 2019/10/10.
//  Copyright © 2019 m.dobashi. All rights reserved.
//

import UIKit

// MARK: - LRadioButtonDelegate

public protocol LRadioButtonDelegate: class {
    func didTapLRadioButton(radioButton: LRadioButton)
}





// MARK: - LRadioButton

public class LRadioButton: UIButton {
    
    
    /// 選択されているかのフラグ
    public var isSelect: Bool = false
    
    /// デリゲート
    public weak var delegate: LRadioButtonDelegate?
    
    /// ラジオボタンのビュー
    public var lRadioView: LRadioView = LRadioView()
    
    /// titleLabelの高さ
    ///
    /// titleLabelより、lRadioViewの方が高ければlRadioViewの高さを返す
    public var height: CGFloat {
        get {
            layoutIfNeeded()
            if titleLabel?.frame.height ?? 0 > lRadioView.frame.height {
                return titleLabel?.frame.height ?? 0
            } else {
                return lRadioView.frame.height
            }
        }
    }
    
    
    /// lRadioViewの選択された時の色とlayerの色を変える
    public var selectColor: UIColor? {
        didSet {
            lRadioView.layer.borderColor = selectColor?.cgColor
            lRadioView.inView.backgroundColor = selectColor
        }
    }

    
    // MARK: init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        contentHorizontalAlignment = .left
        setTitleColor(.black, for: .normal)
        titleLabel?.numberOfLines = 0
    }
    
    
    public convenience init(title:String? = nil, lRadioViewSize: CGSize, color: UIColor?, tag: Int) {
        self.init()

        addTarget(target, action: #selector(didTapRadioButton(sender:)), for: .touchUpInside)
        self.tag = tag
        setTitle(title, for: .normal)
        lRadioView.size = lRadioViewSize
        titleEdgeInsets = .init(top: .zero, left: lRadioView.size.height + 15, bottom: .zero, right: .zero)
        lRadioView.color = color
        lRadioViewConstraint()
        lRadioView.inViewConstraint()
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: Constraint
    
    
    /// lRadioViewの制約
    func lRadioViewConstraint() {
        addSubview(lRadioView)
        lRadioView.translatesAutoresizingMaskIntoConstraints = false
        lRadioView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        lRadioView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        lRadioView.heightAnchor.constraint(equalToConstant: lRadioView.frame.height).isActive = true
        lRadioView.widthAnchor.constraint(equalToConstant: lRadioView.frame.height).isActive = true
        lRadioView.layer.borderWidth = 1.5
        
    }
    
    
    
    // MARK: LRadioButtonTapAction
    
    @objc public func didTapRadioButton(sender: LRadioButton) {
        delegate?.didTapLRadioButton(radioButton: sender)
    }
    
    
    
    
    /// ラジオボタンのタップイベント
    ///
    /// - isSelectがtrueの時はラジオボタンの選択状態にする
    /// - isSelectがfalseの時はラジオボタンの選択状態を解除する
    @objc public func buttonaction(sender: LRadioButton){
        if isSelect == false {
            select()
        } else {
            deSelect()
        }
    }
    
    
    /// 選択された時
    ///
    /// ビューの部分のbackgroundColorを塗りつぶし、
    /// isSelectをtrueにする
    public func select() {
        lRadioView.selectView()
        lRadioView.layer.shadowColor = UIColor.black.cgColor
        lRadioView.layer.shadowOpacity = 0.2
        isSelect = true
    }
    
    
    /// 選択が外れた時
    ///
    /// ビューの部分のbackgroundColorを.clearに塗りつぶし、
    /// isSelectをfalseにする
    public func deSelect() {
        lRadioView.deselectView()
        isSelect = false
        lRadioView.layer.shadowColor = UIColor.clear.cgColor
        lRadioView.layer.shadowOpacity = 0
    }
}








