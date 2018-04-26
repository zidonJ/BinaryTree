//
//  ViewController.swift
//  JBinaryTree
//
//  Created by 姜泽东 on 2018/4/24.
//  Copyright © 2018年 MaiTian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // leaf nodes
        let node5 = BinaryTree.node(.empty, "5", .empty)
        let nodeA = BinaryTree.node(.empty, "a", .empty)
        let node10 = BinaryTree.node(.empty, "10", .empty)
        let node4 = BinaryTree.node(.empty, "4", .empty)
        let node3 = BinaryTree.node(.empty, "3", .empty)
        let nodeB = BinaryTree.node(.empty, "b", .empty)
        
        // intermediate nodes on the left
        let aMinus10 = BinaryTree.node(nodeA, "-", node10)
        let timesLeft = BinaryTree.node(node5, "*", aMinus10)
        
        // intermediate nodes on the right
        let minus4 = BinaryTree.node(.empty, "-", node4)
        let divide3andB = BinaryTree.node(node3, "/", nodeB)
        let timesRight = BinaryTree.node(minus4, "*", divide3andB)
        
        //跟节点
        let tree = BinaryTree.node(timesLeft, "+", timesRight)
        
//        print(tree)
//        print(tree.count)  // 12
        
        recursionPreorderTraversal(tree: tree)
        recursionMiddleorderTraversal(tree: tree)
        recursionPostorderTraversal(tree: tree)
    }

    
    //递归前序遍历
    func recursionPreorderTraversal(tree:BinaryTree<String>?) {
        
        guard let ttree = tree else {
            return
        }
        if ttree.tdata != nil {
            print("前序遍历:",ttree.tdata ?? "")
        }
        recursionPreorderTraversal(tree: tree?.lChild)
        recursionPreorderTraversal(tree: tree?.rChild)
    }
    
    //递归中序遍历
    func recursionMiddleorderTraversal(tree:BinaryTree<String>?) {
        
        guard let ttree = tree else {
            return
        }
        recursionMiddleorderTraversal(tree: tree?.lChild)
        if ttree.tdata != nil {
            print("中序遍历:",ttree.tdata ?? "")
        }
        recursionMiddleorderTraversal(tree: tree?.rChild)
    }

    //递归后序遍历
    func recursionPostorderTraversal(tree:BinaryTree<String>?) {
        
        guard let ttree = tree else {
            return
        }
        recursionPostorderTraversal(tree: tree?.lChild)
        recursionPostorderTraversal(tree: tree?.rChild)
        if ttree.tdata != nil {
            print("后序遍历:",ttree.tdata ?? "")
        }
    }
}

