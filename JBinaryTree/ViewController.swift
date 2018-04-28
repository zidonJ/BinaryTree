//
//  ViewController.swift
//  JBinaryTree
//
//  Created by 姜泽东 on 2018/4/24.
//  Copyright © 2018年 MaiTian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var a:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // leaf nodes
        let node7 = BinaryTree.node(.empty, "7", .empty)
        let node8 = BinaryTree.node(.empty, "8", .empty)
        let node6 = BinaryTree.node(node7, "6", node8)
        let node4 = BinaryTree.node(.empty, "4", node6)
        let node5 = BinaryTree.node(.empty, "5", .empty)
        
        // intermediate nodes on the left
        let timesLeft = BinaryTree.node(node4, "2", .empty)
        
        // intermediate nodes on the right
        let timesRight = BinaryTree.node(.empty, "3", node5)
        
        //跟节点
        let tree = BinaryTree.node(timesLeft, "1", timesRight)
        
        let tree1 = BinaryTree.node(timesLeft, "1", timesRight)
        
        print("若为1,两棵树相等",tree.is_equal(t1: tree1))
        
        
        tree.recursionPreorderTraversal()
        tree.recursionMiddleorderTraversal()
        tree.recursionPostorderTraversal()
        print("二叉树的深度:\(tree.hight_tree())")
        print("节点数量\(tree.count)")
    }

}

