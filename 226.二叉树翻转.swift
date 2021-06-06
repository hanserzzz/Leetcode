
/*
 226. 翻转二叉树
 翻转一棵二叉树。

 示例：

 输入：

      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 输出：

      4
    /   \
   7     2
  / \   / \
 9   6 3   1

 */

public class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?

    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func invertTree(_ root: TreeNode?) -> TreeNode? {
    if root == nil { return root }

    invertTree(root?.left)
    invertTree(root?.right)

    let left: TreeNode? = root?.left
    root?.left = root?.right
    root?.right = left
    return root
}
