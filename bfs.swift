/**
    广度优先遍历 递归非递归
 */


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; right = nil }
    public init(_ val: Int) { self.val = val; self.left = nil; right = nil }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) { self.val = val; self.left = left; self.right = right }

}


func bfs_normal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return []
    }
    
    var result = [Int]()
    var queue = [TreeNode]()
    queue.append(root)
    while !queue.isEmpty {
        let node = queue.removeFirst()
        result.append(node.val)
        
        if let left = node.left {
            queue.append(left)
        }
        if let right = node.right {
            queue.append(right)
        }
    }
    
    return result
}

//func bfs_recursion_helper(_ root: TreeNode?, _ result: inout [Int]) {
//    guard let root = root else {
//        return
//    }
//    
//    result.append(root.val)
//    bfs_recursion_helper(root.left, &result)
//    bfs_recursion_helper(root.right, &result)
//}
//
//func bfs_recursion(_ root: TreeNode?) -> [Int] {
//    var result = [Int]()
//    bfs_recursion_helper(root, &result)
//    return result
//}


let node9 = TreeNode(9)
let node8 = TreeNode(8)
let node7 = TreeNode(7)
let node6 = TreeNode(6)
let node5 = TreeNode(5, node8, node9)
let node4 = TreeNode(4)
let node3 = TreeNode(3, node6, node7)
let node2 = TreeNode(2, node4, node5)
let node1 = TreeNode(1, node2, node3)


let nResult = bfs_normal(node1)
print(nResult)

//let rResult = bfs_recursion(node1)
//print(rResult)
