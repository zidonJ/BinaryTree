//
//  BinaryTree.swift
//  JBinaryTree
//
//  Created by 姜泽东 on 2018/4/24.
//  Copyright © 2018年 MaiTian. All rights reserved.
//

import UIKit

/*
 在 enum 的定义中嵌套自身对于 class 这样的引用类型来说没有任何问题,但是对于像 struct 或者 enum 这样的值类型来说,
 普通的做法是不可行的.我们需要在定义前面加上 indirect 来提示编译器不要直接在值类型中直接嵌套.
 
 //T:Equatable  遵循比较协议
*/

public indirect enum BinaryTree<T:Equatable> {
    
    case node(BinaryTree<T>, T, BinaryTree<T>)
    case empty
    
    //MARK:节点的数量
    public var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
    
    public var tdata:T? {
        switch self {
        case let .node(_, data, _):
            return data
        case .empty:
            return nil
        }
    }
    
    public var lChild:BinaryTree<T> {
        switch self {
        case let .node(left, _, _):
            return left
        case .empty:
            return BinaryTree.empty
        }
    }
    
    public var rChild:BinaryTree<T> {
        
        switch self {
        case let .node(_, _, right):
            return right
        case .empty:
            return BinaryTree.empty
        }
    }
}

extension BinaryTree: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [\(left.description)], right = [\(right.description)]"
        case .empty:
            return ""
        }
    }
}

extension BinaryTree {
    public func traverseInOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    
    public func traversePreOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    
    public func traversePostOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        }
    }
}

extension BinaryTree {
    
    //MARK:递归前序遍历
    func recursionPreorderTraversal() {
        
        
        switch self {
        case .empty:
            return
            
        case .node(_, _, _):

            if self.tdata != nil {
                print("前序遍历:",self.tdata ?? "")
            }
            lChild.recursionPreorderTraversal()
            rChild.recursionPreorderTraversal()
        }
        
    }
    
    //MARK:递归中序遍历
    func recursionMiddleorderTraversal() {
        
        switch self {
        case .empty:
            
            return
            
        case .node(_, _, _):
            lChild.recursionMiddleorderTraversal()
            if self.tdata != nil {
                print("中序遍历:",self.tdata ?? "")
            }
            rChild.recursionMiddleorderTraversal()
        }
    }
    
    //MARK:递归后序遍历
    func recursionPostorderTraversal() {
        
        
        switch self {
        case .empty:
            
            return
        case .node(_, _, _):

            lChild.recursionPostorderTraversal()
            rChild.recursionPostorderTraversal()
            if self.tdata != nil {
                print("后序遍历:",self.tdata ?? "")
            }
            
        }
    }
    
    //MARK:层序遍历
    func layerTraversal() {
        
        
    }
    
    //MARK:求二叉树的深度
    func hight_tree() -> Int{
        
        var h:Int,left:Int,right:Int;
        
        switch self {
        case .empty:
            return 0
            
        case .node(_, _, _):
            left = lChild.hight_tree()
            right = rChild.hight_tree()
            h = left > right ? left + 1 : right + 1;
            return h;
        }

    }
    
    //MARK:判断两棵树相等 若为1才相等
    func is_equal(t1:BinaryTree<T>) -> Int {
        
        switch self {
        case .empty:
            switch t1 {
                case .empty:
                return 1
                case .node(_, _, _):
                return 0
            }
        case .node(_, _, _):
            switch t1 {
            case .empty:
                return 0
            case .node(_, _, _):
                if self.tdata == t1.tdata  {
                    if lChild.is_equal(t1: t1.lChild) > 0 {
                        if rChild.is_equal(t1: t1.rChild) > 0 {
                            return 1
                        }
                    }
                }
                break
            }
        }
        return 0
    }
}

