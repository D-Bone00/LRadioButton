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

    // MARK: init
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    public convenience init(frame: CGRect, title:String? = nil, lRadioFrame: CGRect, color: UIColor?, tag: Int) {
        self.init(frame: frame)

        addTarget(target, action: #selector(radioButtontapAction(sender:)), for: .touchUpInside)
        self.tag = tag
        
        lRadioView = LRadioView(frame: lRadioFrame, color: color)
        addSubview(lRadioView!)
        lRadioView?.translatesAutoresizingMaskIntoConstraints = false
        lRadioView?.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        lRadioView?.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        lRadioView?.heightAnchor.constraint(equalToConstant: (lRadioView?.frame.height)!).isActive = true
        lRadioView?.widthAnchor.constraint(equalToConstant: (lRadioView?.frame.height)!).isActive = true
        lRadioView?.layer.borderWidth = 1
        lRadioView?.isUserInteractionEnabled = false
        

        
        
        
        bringSubviewToFront(lRadioView!)
        
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
        titleEdgeInsets = .init(top: .zero, left: lRadioFrame.origin.x + lRadioFrame.width + 5, bottom: 0, right: 0)
        contentHorizontalAlignment = .left
        titleLabel?.numberOfLines = 0
        
        titleLabel?.sizeToFit()
        
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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








// MARK: - LRadioView

/// 選択状態を表すためのビュー
public class LRadioView: UIView {
    
    
    /// 背景色
    public var selectColor: UIColor?
    
    
    /// 選択された時にbackgroundColorを塗りつぶしたりする部分
    public lazy var inView: UIView = {
        let view: UIView = UIView()
        view.frame.size = CGSize(width: self.frame.height - 10, height: self.frame.height - 10)
        
        return view
    }()
    
    
    // MARK: Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        layer.cornerRadius = frame.height / 2
    }
    
    
    public convenience init(frame: CGRect, color: UIColor? = .black) {
        self.init(frame: frame)
        
        
        addSubview(inView)
        
        selectColor = color
        layer.cornerRadius = frame.height / 2
        layer.borderWidth = 1
        layer.borderColor = selectColor?.cgColor
        
        
        inView.translatesAutoresizingMaskIntoConstraints = false
        inView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        inView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        inView.widthAnchor.constraint(equalToConstant: inView.frame.height).isActive = true
        inView.heightAnchor.constraint(equalToConstant: inView.frame.height).isActive = true
        inView.layer.cornerRadius = inView.frame.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    // MARK: Select, Deselect
    
    public func selectView() {
        inView.backgroundColor = selectColor
    }
    
    
    public func deselectView() {
        inView.backgroundColor = .clear
    }
}
