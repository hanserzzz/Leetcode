/*
725. 分隔链表
给你一个头结点为 head 的单链表和一个整数 k ，请你设计一个算法将链表分隔为 k 个连续的部分。

每部分的长度应该尽可能的相等：任意两部分的长度差距不能超过 1 。这可能会导致有些部分为 null 。

这 k 个部分应该按照在链表中出现的顺序排列，并且排在前面的部分的长度应该大于或等于排在后面的长度。

返回一个由上述 k 部分组成的数组。

 
示例 1：


输入：head = [1,2,3], k = 5
输出：[[1],[2],[3],[],[]]
解释：
第一个元素 output[0] 为 output[0].val = 1 ，output[0].next = null 。
最后一个元素 output[4] 为 null ，但它作为 ListNode 的字符串表示是 [] 。
示例 2：


输入：head = [1,2,3,4,5,6,7,8,9,10], k = 3
输出：[[1,2,3,4],[5,6,7],[8,9,10]]
解释：
输入被分成了几个连续的部分，并且每部分的长度相差不超过 1 。前面部分的长度大于等于后面部分的长度。
 

提示：

链表中节点的数目在范围 [0, 1000]
0 <= Node.val <= 1000
1 <= k <= 50
*/

public class ListNode {
	public var val: Int
	public var next: ListNode?
	public init() { self.val = 0; self.next = nil; }
	public init(_ val: Int) { self.val = val; self.next = nil; }
	public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func splitListToParts(_ head: ListNode?,_ k: Int) -> [ListNode?] {
	var count = 0, tmp = head
	while tmp != nil {
		count += 1
		tmp = tmp?.next
	}

	var result: [ListNode?] = Array(repeating: ListNode.init(), count: k)

	var temp = head

	let kk = Int(count / k), remainder = Int(count % k)
	for i in 0..<k {
		result[i] = temp

		let size = kk + (i < remainder ? 1 : 0)
		if size > 0 {
			for _ in 0..<size-1 {
				temp = temp?.next
			}
			let next = temp?.next
			temp?.next = nil
			temp = next
		}
	}

	return result
}

let node10 = ListNode(10)
let node9 = ListNode(9, node10)
let node8 = ListNode(8, node9)
let node7 = ListNode(7, node8)
let node6 = ListNode(6, node7)
let node5 = ListNode(5, node6)
let node4 = ListNode(4, node5)
let node3 = ListNode(3, nil)
let node2 = ListNode(2, node3)
let node1 = ListNode(1, node2)

let r = splitListToParts(node1, 5)

for n in r {
	print(n?.val)
}

