/*

199. 二叉树的右视图
给定一个二叉树的 根节点 root，想象自己站在它的右侧，按照从顶部到底部的顺序，返回从右侧所能看到的节点值。

 

示例 1:



输入: [1,2,3,null,5,null,4]
输出: [1,3,4]
示例 2:

输入: [1,null,3]
输出: [1,3]
示例 3:

输入: []
输出: []
 

提示:

二叉树的节点个数的范围是 [0,100]
-100 <= Node.val <= 100 
*/


public class TreeNode {
	var val: Int
	var left: TreeNode?
	var right: TreeNode?

	init() { self.val = 0; self.left = nil; self.right = nil }
	init(_ val: Int) { self.val = val; self.left = nil; self.right = nil }
	init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) { self.val = val; self.left = left; self.right = right }
}


func rightSideView(_ root: TreeNode?) -> [Int] {
	guard let _root = root { return }

	var isFirst = true
	var res = [Int]()
	var current = [TreeNode]()
	var next = [TreeNode]()
	current.append(_root)

	while !current.isEmpty {
		let node = current.removeFirst()
		if isFirst {
			res.append(node.val)
			isFirst = false
		}

		if let right = node.right {
			next.append(right)
		}

		if let left = node.left {
			next.append(left)
		}

		if current.isEmpty {
			isFirst = true
			let tmp = next
			next = current
			current = tmp
		}

	}

	return res
}




