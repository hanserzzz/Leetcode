/*
655. 输出二叉树
在一个 m*n 的二维字符串数组中输出二叉树，并遵守以下规则：

行数 m 应当等于给定二叉树的高度。
列数 n 应当总是奇数。
根节点的值（以字符串格式给出）应当放在可放置的第一行正中间。根节点所在的行与列会将剩余空间划分为两部分（左下部分和右下部分）。你应该将左子树输出在左下部分，右子树输出在右下部分。左下和右下部分应当有相同的大小。即使一个子树为空而另一个非空，你不需要为空的子树输出任何东西，但仍需要为另一个子树留出足够的空间。然而，如果两个子树都为空则不需要为它们留出任何空间。
每个未使用的空间应包含一个空的字符串""。
使用相同的规则输出子树。
示例 1:

输入:
     1
    /
   2
输出:
[["", "1", ""],
 ["2", "", ""]]
示例 2:

输入:
     1
    / \
   2   3
    \
     4
输出:
[["", "", "", "1", "", "", ""],
 ["", "2", "", "", "", "3", ""],
 ["", "", "4", "", "", "", ""]]
示例 3:

输入:
      1
     / \
    2   5
   / 
  3 
 / 
4 
输出:
[["",  "",  "", "",  "", "", "", "1", "",  "",  "",  "",  "", "", ""]
 ["",  "",  "", "2", "", "", "", "",  "",  "",  "",  "5", "", "", ""]
 ["",  "3", "", "",  "", "", "", "",  "",  "",  "",  "",  "", "", ""]
 ["4", "",  "", "",  "", "", "", "",  "",  "",  "",  "",  "", "", ""]]
注意: 二叉树的高度在范围 [1, 10] 中
*/

import Foundation

public class TreeNode {
	public var val: Int
	public var left: TreeNode?
	public var right: TreeNode?
	public init() { self.val = 0; self.left = nil; right = nil }
	public init(_ val: Int) { self.val = val; self.left = nil; right = nil }
	public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) { self.val = val; self.left = left; self.right = right }

}


var maxDepth = 0
func preorder(_ root: TreeNode?, _ depth: Int) {
	guard let _root = root else { return }

	maxDepth = max(maxDepth, depth)
	preorder(_root.left, depth + 1)
	preorder(_root.right, depth + 1)
}

func finish(_ root: TreeNode?, _ result: inout [[String]], _ i: Int, _ l: Int, _ r: Int) {
	guard let _root = root else { return }
	result[i][(l + r)/2] = String(_root.val)
	finish(_root.left, &result, i + 1, l, (l + r)/2)
	finish(_root.right, &result, i + 1, (l + r + 1)/2,r)
}

func printTree(_ root: TreeNode?) -> [[String]] {
    guard let _root = root else { return [] }

    preorder(_root, 1)
    let row = maxDepth
    let column = (1 << maxDepth) - 1
    var result = Array(repeating: Array(repeating: "", count: column), count: row)
    finish(_root, &result, 0, 0, column)

    return result
}



let node4 = TreeNode(4)
let node2 = TreeNode(2, nil, nil)
let node3 = TreeNode(3)
let node1 = TreeNode(1, node2, nil)

let result = printTree(node1)
print(result)




