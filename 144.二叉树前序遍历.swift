/*

给你二叉树的根节点 root ，返回它节点值的 前序 遍历。
*/




public class TreeNode {
	public var val: Int
	public var left: TreeNode?
	public var right: TreeNode?
	public init() {self.val = 0; self.left = nil; self.right = nil;}
	public init(_ val: Int) {self.val = val; self.left = nil; self.right = nil;}
	public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {self.val = val; self.left = left; self.right = right;}
}


func recursive(_ root: TreeNode?, _ result: inout [Int]) {
	if root == nil { return }	

	result.append(root!.val)
	recursive(root!.left, &result)
	recursive(root!.right, &result)
}


func preorderTraversal (_ root: TreeNode?) -> [Int] {
	var result = [Int]()
	recursive(root, &result)
	return result
}



let node7 = TreeNode(7)
let node13 = TreeNode(13)
let node16 = TreeNode(16)
let node20 = TreeNode(20)

let node14 = TreeNode(14, node7, node13)
let node19 = TreeNode(19, node16, node20)

let node15 = TreeNode(15, node14, node19)

print(preorderTraversal(node15))