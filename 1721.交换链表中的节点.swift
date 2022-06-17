/*
1721. 交换链表中的节点
给你链表的头节点 head 和一个整数 k 。

交换 链表正数第 k 个节点和倒数第 k 个节点的值后，返回链表的头节点（链表 从 1 开始索引）。

 

示例 1：


输入：head = [1,2,3,4,5], k = 2
输出：[1,4,3,2,5]
示例 2：

输入：head = [7,9,6,6,7,8,3,0,9,5], k = 5
输出：[7,9,6,6,8,7,3,0,9,5]
示例 3：

输入：head = [1], k = 1
输出：[1]
示例 4：

输入：head = [1,2], k = 1
输出：[2,1]
示例 5：

输入：head = [1,2,3], k = 2
输出：[1,2,3]
 

提示：

链表中节点的数目是 n
1 <= k <= n <= 105
0 <= Node.val <= 100
*/

public class ListNode {
    var val: Int
    var next: ListNode?
    init() { self.val = 0; self.next = nil }
    init(_ val: Int) { self.val = val; self.next = nil }
    init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}



 func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
    var _k = k
    var fast = head, slow = head

    while let temp = fast, _k > 1 {
        _k -= 1
        fast = temp.next
    }
    
    let pNode = fast
    while let temp = fast, temp.next != nil {
        fast = temp.next
        slow = slow?.next
    }

    let v = pNode?.val
    pNode?.val = slow?.val ?? 0
    slow?.val = v ?? 0
    
    return head
}


let node5 = ListNode(5)
let node4 = ListNode(4, node5)
let node3 = ListNode(3, node4)
let node2 = ListNode(2, node3)
let node1 = ListNode(1, node2)

var t = swapNodes(node1, 2)
while let tmp = t {
    print(tmp.val)
    t = t?.next
}



