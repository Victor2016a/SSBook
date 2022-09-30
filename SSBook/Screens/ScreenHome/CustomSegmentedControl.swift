//
//  CustomSegmentedControl.swift
//  SSBook
//
//  Created by Victor Vieira on 28/09/22.
//

import UIKit

class CustomSegmentedControl: UIView {
  private var buttonTitles: [String]!
  private var buttons: [UIButton] = []
  private var selectorView: UIView!
  var textColor: UIColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
  var selectorViewColor: UIColor = UIColor(red: 160/255, green: 118/255, blue: 242/255, alpha: 1)
  var selectorTextColor: UIColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
  var stack = UIStackView()
  
  private func configStackView() {
    
    stack = UIStackView(arrangedSubviews: buttons)
    stack.axis = .horizontal
    stack.alignment = .fill
    stack.distribution = .fillEqually
    addSubview(stack)
    stack.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stack.topAnchor.constraint(equalTo: topAnchor),
      stack.leadingAnchor.constraint(equalTo: leadingAnchor),
      stack.trailingAnchor.constraint(equalTo: trailingAnchor),
      stack.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  private func configSelectorView() {
    let selectorWidth = frame.width / CGFloat(self.buttonTitles.count)
    selectorView = UIView(frame: CGRect(x: 0, y: self.frame.height, width: selectorWidth, height: 3))
    selectorView.backgroundColor = selectorViewColor
    addSubview(selectorView)
  }
  
  private func createButton() {
    buttons = [UIButton]()
    buttons.removeAll()
    subviews.forEach({$0.removeFromSuperview()})
    for buttonTitle in buttonTitles {
      let button = UIButton(type: .system)
      button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 14)
      button.setTitle(buttonTitle,for:.normal)
      button.addTarget(self, action:#selector(CustomSegmentedControl.buttonAction(sender:)), for: .touchUpInside)
      button.setTitleColor(textColor,for:.normal)
      buttons.append(button)
      buttons[0].setTitleColor(selectorTextColor,for:.normal)
    }
  }
  
  @objc func buttonAction(sender:UIButton){
    for (buttonIndex, btn) in buttons.enumerated() {
      btn.setTitleColor(textColor,for:.normal)
      if btn == sender {
        let selectorPosition = frame.width/CGFloat(buttonTitles.count)*CGFloat(buttonIndex)
        UIView.animate(withDuration: 0.3) {
          self.selectorView.frame.origin.x = selectorPosition
        }
        btn.setTitleColor(selectorTextColor,for:.normal)
      }
    }
  }
  
  private func updateView() {
    createButton()
    configSelectorView()
    configStackView()
  }
  
  convenience init(frame: CGRect, buttonTitle : [String]) {
    self.init()
    self.frame = frame
    self.buttonTitles = buttonTitle
  }
  
  override func draw (_ rect: CGRect) {
    super.draw(rect)
    updateView()
  }
  func setButtonTitles (buttonTitles:[String]) {
    self.buttonTitles = buttonTitles
    updateView()
  }
}
