/*

 25. K 个一组翻转链表
 给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。

 k 是一个正整数，它的值小于或等于链表的长度。

 如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。

 进阶：

 你可以设计一个只使用常数额外空间的算法来解决此问题吗？
 你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。

 示例 1：

 输入：head = [1,2,3,4,5], k = 2
 输出：[2,1,4,3,5]
 示例 2：

 输入：head = [1,2,3,4,5], k = 3
 输出：[3,2,1,4,5]
 示例 3：

 输入：head = [1,2,3,4,5], k = 1
 输出：[1,2,3,4,5]
 示例 4：

 输入：head = [1], k = 1
 输出：[1]
 提示：

 列表中节点的数量在范围 sz 内
 1 <= sz <= 5000
 0 <= Node.val <= 1000
 1 <= k <= sz

 */

public class ListNode: Equatable {
    public var val: Int
    public var next: ListNode?

    public static func < (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val < rhs.val
    }

    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.val == rhs.val
    }

    public static func != (_ n1: ListNode, n2: ListNode) -> Bool { return n1.val != n2.val }
    init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func reverseWithRange(_ node1: ListNode?, _ node2: ListNode?) -> ListNode? {
    var pre: ListNode?, cur = node1, next = node1?.next
    while cur != node2 {
        cur?.next = pre
        pre = cur
        cur = next
        next = next?.next
    }
    return pre
}

func reverseGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    var left = head, right = head
    for _ in 0 ..< k {
        if right == nil { return head }
        right = right?.next
    }

    let nHead = reverseWithRange(left, right)
    head?.next = reverseGroup(right, k)
    return nHead
}

let node6 = ListNode(6, nil)
let node5 = ListNode(5, node6)
let node4 = ListNode(4, node5)
let node3 = ListNode(3, node4)
let node2 = ListNode(2, node3)
let node1 = ListNode(1, node2)

var tmp = reverseGroup(node1, 2)
while tmp != nil {
    print(tmp!.val)
    tmp = tmp!.next
}
