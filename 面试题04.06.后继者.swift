/*
面试题 04.06. 后继者
设计一个算法，找出二叉搜索树中指定节点的“下一个”节点（也即中序后继）。

如果指定节点没有对应的“下一个”节点，则返回null。

示例 1:

输入: root = [2,1,3], p = 1

  2
 / \
1   3

输出: 2
示例 2:

输入: root = [5,3,6,2,4,null,null,1], p = 6

      5
     / \
    3   6
   / \
  2   4
 /   
1

输出: null

*/


public class TreeNode {
	public var val: Int
	public var left: TreeNode?
	public var right: TreeNode?
	public init() {self.val = 0; self.left = nil; self.right = nil;}
	public init(_ val: Int) {self.val = val; self.left = nil; self.right = nil;}
	public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {self.val = val; self.left = left; self.right = right;}
}

var res: TreeNode?
var prev: TreeNode?
func inorderSuccessor(_ root: TreeNode?, _ p: TreeNode?) -> TreeNode? {
	res = nil
	prev = nil
	helper(root, p)

	return res
}

func helper(_ root: TreeNode?, _ p: TreeNode?) {
	if root == nil || p == nil { return }

	helper(root!.left, p)
	if let _prev = prev {
		if res == nil {
			res = root
		}
		return
	}

	if root!.val == p!.val {
		prev = root
	}

	helper(root!.right, p)
}












