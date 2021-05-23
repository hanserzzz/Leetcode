/**
 2. 两数相加
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

 请你将两个数相加，并以相同形式返回一个表示和的链表。

 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 示例 1：

 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[7,0,8]
 解释：342 + 465 = 807.
 示例 2：

 输入：l1 = [0], l2 = [0]
 输出：[0]
 示例 3：

 输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 输出：[8,9,9,9,0,0,0,1]

 提示：

 每个链表中的节点数在范围 [1, 100] 内
 0 <= Node.val <= 9
 题目数据保证列表表示的数字不含前导零

 */

public class ListNode {
    var val: Int
    var next: ListNode?

    init(_ val: Int) { self.val = val; next = nil }
    init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

// var node6: ListNode = ListNode(9,node7)
// var node5: ListNode = ListNode(9,node6)
var node4 = ListNode(9, nil)
var node3 = ListNode(4, node4)
var node2 = ListNode(6, node3)
var node1 = ListNode(5, node2)

// var node13: ListNode = ListNode(9)
var node12 = ListNode(9, nil)
var node11 = ListNode(4, node12)
var node10 = ListNode(2, node11)

// let node5 = ListNode(5, nil)
// let node4 = ListNode(4, node5)
// let node3 = ListNode(3, node4)
// let node2 = ListNode(2, node3)
// let node1 = ListNode(1, node2)
//
// var head = reverseList(node1)
//// var head: ListNode? = node1
// while head != nil {
//    print(head!.val)
//    head = head!.next
// }

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var rL1 = l1
    var rL2 = l2

    while rL1 != nil, rL2 != nil {
        rL1 = rL1!.next
        rL2 = rL2!.next
    }

    if rL2 == nil {
        rL1 = l1
        rL2 = l2
    } else {
        rL1 = l2
        rL2 = l1
    }

    let head = rL1
    // 以rL1为主轴
    var carry = 0
    var temp: ListNode?
    // 公共长度部分
    while rL1 != nil || rL2 != nil {
        let v = rL1!.val + (rL2?.val ?? 0) + carry
        rL1!.val = v % 10
        carry = v / 10
        temp = rL1

        rL1 = rL1!.next
        rL2 = rL2?.next
    }

    if carry > 0 {
        temp!.next = ListNode(1)
    }

    return head
}

print("--------------")
var sum = addTwoNumbers(node1, node10)
// print(sum?.val)
while sum != nil {
    print(sum!.val)
    sum = sum!.next
}
