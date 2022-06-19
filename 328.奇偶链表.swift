/*
328. 奇偶链表
给定单链表的头节点 head ，将所有索引为奇数的节点和索引为偶数的节点分别组合在一起，然后返回重新排序的列表。

第一个节点的索引被认为是 奇数 ， 第二个节点的索引为 偶数 ，以此类推。

请注意，偶数组和奇数组内部的相对顺序应该与输入时保持一致。

你必须在 O(1) 的额外空间复杂度和 O(n) 的时间复杂度下解决这个问题。

 

示例 1:



输入: head = [1,2,3,4,5]
输出: [1,3,5,2,4]
示例 2:



输入: head = [2,1,3,5,6,4,7]
输出: [2,3,6,7,1,5,4]

*/

public class ListNode {
	public var val: Int
	public var next: ListNode?
	public init() { self.val = 0; self.next = nil }
	public init(_ val: Int) { self.val = val; self.next = nil }
	public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func oddEventList(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil { return head }
    let t1 = head
    let t2 = head?.next
    var idx = 1
    var head1 = head
    var head2 = head?.next
    var temp = head2?.next
    while let _temp = temp {
        if idx % 2 == 1 {
            head1?.next = _temp
            head1 = _temp
        } else {
            head2?.next = _temp
            head2 = _temp
        }
        temp = _temp.next
    }
    idx += 1
    head1?.next = t2
    head2?.next = nil
    return t1
}


let node5 = ListNode(5)
let node4 = ListNode(4, node5)
let node3 = ListNode(3, node4)
let node2 = ListNode(2, node3)
let node1 = ListNode(1, node2)

var tmp = oddEventList(node1)
while tmp != nil {
	print(tmp!.val)
	tmp = tmp!.next()
}


