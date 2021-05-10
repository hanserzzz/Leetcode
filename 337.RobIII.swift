/**

 337. 打家劫舍 III
 在上次打劫完一条街道之后和一圈房屋后，小偷又发现了一个新的可行窃的地区。这个地区只有一个入口，我们称之为“根”。 除了“根”之外，每栋房子有且只有一个“父“房子与之相连。一番侦察之后，聪明的小偷意识到“这个地方的所有房屋的排列类似于一棵二叉树”。 如果两个直接相连的房子在同一天晚上被打劫，房屋将自动报警。

 计算在不触动警报的情况下，小偷一晚能够盗取的最高金额。

 示例 1:

 输入: [3,2,3,null,3,null,1]

      3
     / \
    2   3
     \   \
      3   1

 输出: 7
 解释: 小偷一晚能够盗取的最高金额 = 3 + 3 + 1 = 7.
 示例 2:

 输入: [3,4,5,1,3,null,1]

      3
     / \
    4   5
   / \   \
  1   3   1

 输出: 9
 解释: 小偷一晚能够盗取的最高金额 = 4 + 5 = 9.

 */

/**

 left[0] : 左子树不选择的值
 left[1] : 左子树选择中的值

 right ...同上逻辑

 dp[i] = max(notSelect, select)
 select = node.val + left[0] + right[0]
 notSelect = max(left[0], left[1]) + max(right[0], right[1])

 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?

    init(_ val: Int) { self.val = val; left = nil; right = nil }
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) { self.val = val; self.left = left; self.right = right }
}

func dfs(_ root: Node?) -> [Int] {
    guard let _root = root else {
        return [0, 0]
    }

    let lefts = dfs(_root.left)
    let rights = dfs(_root.right)

    let select = _root.val + lefts[0] + rights[0]
    let notSelect = max(lefts[0], lefts[1]) + max(rights[0], rights[1])
    return [notSelect, select]
}

func rob(_ root: TreeNode?) -> Int {
    let result = dfs(root)
    return max(result[0], result[1])
}
