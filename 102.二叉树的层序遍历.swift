/*
102. 二叉树的层序遍历
给你二叉树的根节点 root ，返回其节点值的 层序遍历 。 （即逐层地，从左到右访问所有节点）。

 

示例 1：


输入：root = [3,9,20,null,null,15,7]
输出：[[3],[9,20],[15,7]]
示例 2：

输入：root = [1]
输出：[[1]]
示例 3：

输入：root = []
输出：[]
*/


func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var ans = [[Int]]()
    func loop(_ node: TreeNode?, _ h: Int) {
        if node == nil { return }
        if ans.count <= h { ans.append([]) }
        ans[h].append(node!.val)

        loop(node!.left, h + 1)
        loop(node!.right, h + 1)
    }
    loop(root, 0)
    return ans
}


