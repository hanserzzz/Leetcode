/*
19. 删除链表的倒数第 N 个结点
给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。

 

示例 1：


输入：head = [1,2,3,4,5], n = 2
输出：[1,2,3,5]
示例 2：

输入：head = [1], n = 1
输出：[]
示例 3：

输入：head = [1,2], n = 1
输出：[1]
 

提示：

链表中结点的数目为 sz
1 <= sz <= 30
0 <= Node.val <= 100
1 <= n <= sz

*/


public class ListNode {
	var val: Int
	var next: ListNode?

	public init() { self.val = 0; self.next = nil }
	public init(_ val: Int) { self.val = val; self.next = nil }
	public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
	var _n = n - 1
	var prev: ListNode?
	var fast = head, slow = head
	while let _fast = fast, _n > 0 {
		fast = _fast.next
		_n -= 1
	}

	while let _fast = fast {
		fast = _fast.next
		prev = slow
		slow = slow?.next
	}

	if let _prev = prev {
		_prev.next = slow?.next
	}

	return slow === head ? head?.next : head
}








