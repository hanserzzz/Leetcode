

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?

    init(_ val: Int) { self.val = val; left = nil; right = nil }
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) { self.val = val; self.left = left; self.right = right }
}

/*

 	15
    /  \
   6   23
  / \  / \
 4  7 19 71
 \    /  /\
 5  17  50 75
 */

func createBinaryTree() -> TreeNode {
    let node5 = TreeNode(5)
    let node17 = TreeNode(17)
    let node50 = TreeNode(50)
    let node75 = TreeNode(75)
    let node4 = TreeNode(4, nil, node5)
    let node7 = TreeNode(7)
    let node19 = TreeNode(19, node17, nil)
    let node71 = TreeNode(71, node50, node75)
    let node6 = TreeNode(6, node4, node7)
    let node23 = TreeNode(23, node19, node71)
    let root = TreeNode(15, node6, node23)
    return root
}

// 前序遍历
func preTraverse(_ root: TreeNode?) {
    if root == nil { return }
    print(root!.val)

    preTraverse(root!.left)
    preTraverse(root!.right)
}

// 中序遍历
func midTraverse(_ root: TreeNode?) {
    if root == nil { return }
    midTraverse(root!.left)
    print(root!.val)
    midTraverse(root!.right)
}

// 后续遍历
func aftTraverse(_ root: TreeNode?) {
    if root == nil { return }
    aftTraverse(root!.left)
    aftTraverse(root!.right)
    print(root!.val)
}

let root = createBinaryTree()
aftTraverse(root)
