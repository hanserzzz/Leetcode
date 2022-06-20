/*

86. 分隔链表
给你一个链表的头节点 head 和一个特定值 x ，请你对链表进行分隔，使得所有 小于 x 的节点都出现在 大于或等于 x 的节点之前。

你应当 保留 两个分区中每个节点的初始相对位置。

 

示例 1：


输入：head = [1,4,3,2,5,2], x = 3
输出：[1,2,2,4,3,5]
示例 2：

输入：head = [2,1], x = 2
输出：[1,2]

*/


public class ListNode {
	var val: Int
	var next: ListNode?

	init() { self.val = 0; self.next = nil }
	init(_ val: Int) { self.val = val; self.next = nil }
	init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
	var node = head
	var head1: ListNode?, iteration1: ListNode?
	var head2: ListNode?, iteration2: ListNode?
	while let _node = node {
		if _node.val < x {
			if let _iteration1 = iteration1 {
				_iteration1.next = _node
			}  else {
				head1 = _node
			}
			iteration1 = _node
		} else {
			if let _iteration2 = iteration2 {
				_iteration2.next = _node
			} else {
				head2 = _node
			}
			iteration2 = _node
		}
		node = _node.next
	}

	iteration1?.next = head2
	iteration2?.next = nil

	return head1 != nil ？? head1 : head2
}

func printH(_ head: ListNode?) {
	var node = head
	while let _node = node {
		print(_node.val)
		node = _node.next
	}
}



let node2 = ListNode(2)
let node5 = ListNode(5, node2)
let node22 = ListNode(2, node5)
let node3 = ListNode(3, node22)
let node4 = ListNode(4, node3)
let node1 = ListNode(1, node4)


var node = partition(node1, 3)
// var node: ListNode? = node1
while let _node = node {
	print(_node.val)
	node = _node.next
}


