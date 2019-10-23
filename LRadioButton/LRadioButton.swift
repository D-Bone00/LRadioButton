//
//  LRadioButton.swift
//  LRadioButton
//
//  Created by 土橋正晴 on 2019/10/10.
//  Copyright © 2019 m.dobashi. All rights reserved.
//

import Foundation
import UIKit



// MARK: - LRadioButtonDelegate

public protocol LRadioButtonDelegate: class {
    func radioButtontapAction(radioButton: LRadioButton)
}





// MARK: - LRadioButton

public class LRadioButton: UIButton {
    
    
    /// 選択されているかのフラグ
    public var isSelect: Bool = false
    
    /// デリゲート
    public weak var delegate: LRadioButtonDelegate?
    
    /// ラジオボタンのビュー
    public var lRadioView: LRadioView?
    
    
    /// lRadioViewの選択された時の色とlayerの色を変える
    public var selectColor: UIColor? {
        didSet {
            lRadioView?.layer.borderColor = selectColor?.cgColor
            lRadioView?.inView.backgroundColor = selectColor
        }
    }

    
    // MARK: init
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    public convenience init(frame: CGRect, title:String? = nil, lRadioViewSize: CGSize, color: UIColor?, tag: Int) {
        self.init(frame: frame)

        addTarget(target, action: #selector(radioButtontapAction(sender:)), for: .touchUpInside)
        self.tag = tag
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
        titleEdgeInsets = .init(top: .zero, left: lRadioViewSize.height + 15, bottom: 0, right: 0)
        contentHorizontalAlignment = .left
        titleLabel?.numberOfLines = 0
        titleLabel?.sizeToFit()
        
        
        lRadioView = LRadioView(size: lRadioViewSize, color: color)
        lRadioViewConstraint()
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: Constraint
    
    
    /// lRadioViewの制約
    func lRadioViewConstraint() {
        addSubview(lRadioView!)
        lRadioView?.translatesAutoresizingMaskIntoConstraints = false
        lRadioView?.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        lRadioView?.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        lRadioView?.heightAnchor.constraint(equalToConstant: (lRadioView?.frame.height)!).isActive = true
        lRadioView?.widthAnchor.constraint(equalToConstant: (lRadioView?.frame.height)!).isActive = true
        lRadioView?.layer.borderWidth = 1
        
    }
    
    
    
    // MARK: LRadioButtonTapAction
    
    @objc public func radioButtontapAction(sender: LRadioButton) {
        delegate?.radioButtontapAction(radioButton: sender)
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
        lRadioView?.selectView()
        isSelect = true
    }
    
    
    /// 選択が外れた時
    ///
    /// ビューの部分のbackgroundColorを.clearに塗りつぶし、
    /// isSelectをfalseにする
    public func deSelect() {
        lRadioView?.deselectView()
        isSelect = false
    }
}








