/*
 92. 反转链表 II
 给你单链表的头指针 head 和两个整数 left 和 right ，其中 left <= right 。请你反转从位置 left 到位置 right 的链表节点，返回 反转后的链表 。

 示例 1：

 输入：head = [1,2,3,4,5], left = 2, right = 4
 输出：[1,4,3,2,5]
 示例 2：

 输入：head = [5], left = 1, right = 1
 输出：[5]

 提示：

 链表中节点数目为 n
 1 <= n <= 500
 -500 <= Node.val <= 500
 1 <= left <= right <= n

 进阶： 你可以使用一趟扫描完成反转吗？

 思路:
 	1->2->3->4->5->NULL
 	1  2<-3<-4<-5
 ↓
 NULL

 所以，可以先写翻转前N个，然后再接头部即可
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

var successor: ListNode?
func reverseN(_ head: ListNode?, _ n: Int) -> ListNode? {
    if n == 1 {
        successor = head?.next
        return head
    }

    let pNode = reverseN(head?.next, n - 1)
    let pNext = head?.next
    pNext?.next = head
    head?.next = successor
    return pNode
}

func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
    if left == 1 {
        // 翻转合适区间
        return reverseN(head, right)
    }

    // 连接翻转区间
    let next = reverseBetween(head?.next, left - 1, right - 1)
    head?.next = next
    return head
}

let node5 = ListNode(5, nil)
let node4 = ListNode(4, node5)
let node3 = ListNode(3, node4)
let node2 = ListNode(2, node3)
let node1 = ListNode(1, node2)

var tmp = reverseBetween(node1, 2, 4)
while tmp != nil {
    print(tmp!.val)
    tmp = tmp!.next
}
