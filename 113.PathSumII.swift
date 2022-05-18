/*
113. 路径总和 II
给你二叉树的根节点 root 和一个整数目标和 targetSum ，找出所有 从根节点到叶子节点 路径总和等于给定目标和的路径。

叶子节点 是指没有子节点的节点。

 

示例 1：


输入：root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
输出：[[5,4,11,2],[5,8,4,5]]
示例 2：


输入：root = [1,2,3], targetSum = 5
输出：[]
示例 3：

输入：root = [1,2], targetSum = 0
输出：[]
*/


public class TreeNode {
	var val: Int
	var left: TreeNode?
	var right: TreeNode?
	init() { self.val = 0; self.left = nil; self.right = nil }
	init(_ val: Int) { self.val = val; self.left = nil; self.right = nil }
	init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) { self.val = val; self.left = left; self.right = right }
}

func helper(_ root: TreeNode?, _ path: inout [Int], _ targetSum: Int, _ result: inout [[Int]]) {



	if let _root = root {
		path.append(_root.val)
		let sum = targetSum - _root.val
		if _root.left == nil && _root.right == nil {
			if sum == 0 { result.append(path) }
			path.removeLast()
			return
		}


		helper(_root.left, &path, sum, &result)
		helper(_root.right, &path, sum, &result)
		path.removeLast()
	} 
}

func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
	var result = [[Int]]()
	var path = [Int]()

	helper(root, &path, targetSum, &result)
	return result
}



let node7 = TreeNode(7)
let node2 = TreeNode(2)
let node5 = TreeNode(5)
let node1 = TreeNode(1)

let node11 = TreeNode(11, node7, node2)
let node13 = TreeNode(13)
let node4 = TreeNode(4, node5, node1)

let node44 = TreeNode(4, node11, nil)
let node8 = TreeNode(8, node13, node4)

let node55 = TreeNode(5, node44, node8)


let res = pathSum(node55, 22)
print(res)




