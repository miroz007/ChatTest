//
//  CustomStyle.swift
//  MessengerKit_Example
//
//  Created by Stephen Radford on 14/06/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import MessengerKit

struct CustomStyle: MSGMessengerStyle {
    
    var collectionView: MSGCollectionView.Type = CustomCollectionView.self
    
    var inputView: MSGInputView.Type = MSGImessageInputView.self
    
    var headerHeight: CGFloat = 0
    
    var footerHeight: CGFloat = 0
    
    var backgroundColor: UIColor = .groupTableViewBackground
    
    var inputViewBackgroundColor: UIColor = .white
    
    var font: UIFont = .preferredFont(forTextStyle: .body)
    
    var inputFont: UIFont = .systemFont(ofSize: 14)
    
    var inputPlaceholder: String = "Type something..."
    
    var inputTextColor: UIColor = .darkGray
    
    var inputPlaceholderTextColor: UIColor = .lightGray
    
    var outgoingTextColor: UIColor = .white
    
    var outgoingLinkColor: UIColor = .white
    
    var incomingTextColor: UIColor = .darkGray
    
    var incomingLinkColor: UIColor = UIColor(red:1.00, green:0.30, blue:0.13, alpha:1.00)
    
    func size(for message: MSGMessage, in collectionView: UICollectionView) -> CGSize {
        var size: CGSize!
        
        switch message.body {
        case .text(let body):
            
            let bubble = CustomBubble()
            bubble.text = body
            bubble.font = font
            let bubbleSize = bubble.calculatedSize(in: CGSize(width: collectionView.bounds.width, height: .infinity))
            size = CGSize(width: collectionView.bounds.width, height: bubbleSize.height)
            
            break
            
            
        case .emoji:
            
            size = CGSize(width: collectionView.bounds.width, height: 60)
            
            break
            
        default:
            
            size = CGSize(width: collectionView.bounds.width, height: 175)
            
            break
        }
        
        return size
    }
    
    // MARK - Custom Properties
    
    var incomingBorderColor: UIColor = .lightGray
    
    var outgoingBorderColor: UIColor = .clear
    
    /// Colors for the gradient on outgoing bubbles
    var outgoingGradient: [CGColor] = [
        UIColor(red:1.00, green:0.30, blue:0.13, alpha:1.00).cgColor,
        UIColor(red:0.89, green:0.08, blue:0.46, alpha:1.00).cgColor
    ]
    
    /// Colors for the gradient on incoming bubbles
    var incomingGradient: [CGColor] = [
        UIColor.white.cgColor,
        UIColor.white.cgColor
    ]
    
}
