//
//  LinearLayoutView.swift
//  LinearLayoutTesting
//
//  Created by Dominik Plisek on 11/03/15.
//  Copyright (c) 2015 Dominik Plisek. All rights reserved.
//

import UIKit

class LinearLayoutView: UIView {
    
    var margin: CGFloat = 0.0
    var spacing: CGFloat = 0.0

    private let members = NSMutableArray()
    private let spacingConstraints = NSMutableArray()
    
    func addMember(member: UIView) {
        addMember(member, position: members.count)
    }
    
    func addMember(member: UIView, position: Int) {
        member.setTranslatesAutoresizingMaskIntoConstraints(false)
        addSubview(member)
        if position < members.count {
            removeConstraint(spacingConstraints[position] as NSLayoutConstraint)
            spacingConstraints.removeObjectAtIndex(position)
        }
        addConstraints(hConstraintsForMember(member, position: position))
        addConstraints(vConstraintsForMember(member, position: position))
        members.insertObject(member, atIndex: position)
    }
    
    func setSpacing(spacing: CGFloat) {
        for constraint in spacingConstraints {
            
        }
    }
    
    private func hConstraintsForMember(member: UIView, position: Int) -> [AnyObject] {
        return NSLayoutConstraint.constraintsWithVisualFormat(
            "|-\(margin)-[member]-\(margin)-|",
            options: nil,
            metrics: nil,
            views: ["member": member]
        )
    }
    
    private func vConstraintsForMember(member: UIView, position: Int) -> [AnyObject] {
        var constraints = [topConstraintForMember(member, position: position)]
        if (position < members.count) {
            constraints.append(bottomConstraintForMember(member, position: position))
        }
        return constraints
    }
    
    private func topConstraintForMember(member: UIView, position: Int) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint
        switch position {
        case 0:
            constraint = NSLayoutConstraint(
                item: member,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1.0,
                constant: margin
            )
        default:
            constraint = NSLayoutConstraint(
                item: member,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: members[position - 1],
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1.0,
                constant: spacing
            )
        }
        spacingConstraints.insertObject(constraint, atIndex: position)
        return constraint
    }
    
    private func bottomConstraintForMember(member: UIView, position: Int) -> NSLayoutConstraint {
        let constraint =  NSLayoutConstraint(
            item: members[position],
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: member,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: spacing
        )
        spacingConstraints.insertObject(constraint, atIndex: position + 1)
        return constraint
    }
}
