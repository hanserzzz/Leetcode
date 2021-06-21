/*
 234. 回文链表
 请判断一个链表是否为回文链表。

 示例 1:

 输入: 1->2
 输出: false
 示例 2:

 输入: 1->2->2->1
 输出: true
 进阶：
 你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题

 */

public class ListNode: Equatable {
    public static func < (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val < rhs.val
    }

    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.val == rhs.val
    }

    public static func != (_ n1: ListNode, n2: ListNode) -> Bool {
        return n1.val != n2.val
    }

    public var key: Int
    public var val: Int
    public var next: ListNode?
    public var prev: ListNode?
    public init() { val = 0; key = 0; next = nil; prev = nil }
    public init(_ val: Int) { self.val = val; key = 0; next = nil; prev = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; key = 0; self.next = next }
    public init(key: Int, val: Int) { self.val = val; self.key = key; next = nil; prev = nil }
}

var left: ListNode?
func traverse(_ right: ListNode?) -> Bool {
    if right == nil { return true }

    var res = traverse(right?.next)
    res = res && (left?.val == right?.val)
    left = left?.next
    return res
}

func isPlindrome(_ head: ListNode?) -> Bool {
    left = head
    return traverse(head?.next)
}

// let node6 = ListNode(1, nil)
let node5 = ListNode(1, nil)
let node4 = ListNode(2, node5)
let node3 = ListNode(3, node4)
let node2 = ListNode(2, node3)
let node1 = ListNode(1, node2)

print(isPlindrome(node1))

var tmp: ListNode? = node1
while tmp != nil {
    print(tmp!.val)
    tmp = tmp!.next
}
