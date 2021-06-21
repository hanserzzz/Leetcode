/*
 652. 寻找重复的子树
 给定一棵二叉树，返回所有重复的子树。对于同一类的重复子树，你只需要返回其中任意一棵的根结点即可。

 两棵树重复是指它们具有相同的结构以及相同的结点值。

 示例 1：

         1
        / \
       2   3
      /   / \
     4   2   4
        /
       4
 下面是两个重复的子树：

       2
      /
     4
 和

     4
 因此，你需要以列表的形式返回上述重复子树的根结点。

 */

public class TreeNode: Equatable {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?

    public static func == (_ lhs: TreeNode, _ rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val
    }

    init(_ val: Int) { self.val = val; left = nil; right = nil }
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) { self.val = val; self.left = left; self.right = right }
}

var count = [String: Int]()
var result = [TreeNode?]()
func findDupulicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
    // count = [String: Int]()
    // result = [TreeNode?]()
    collect(root)
    return result
}

func collect(_ root: TreeNode?) -> String {
    if root == nil { return "#" }

    let identify = String(root!.val) + "," + collect(root!.left) + collect(root!.right)
    let v = count[identify] ?? 0
    count[identify] = v + 1
    if count[identify] == 2 {
        result.append(root)
    }
    return identify
}
