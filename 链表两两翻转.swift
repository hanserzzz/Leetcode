/*

 链表两两交换
 1->2->3->4->5->6
 2->1->4->3->6->5

 */

public class ListNode {
    var val: Int
    var next: ListNode?

    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

/*
 三指针法

  	1->2->3->4->5->6
 	2->1->4->3->6->5
 */

func reverseList(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil { return head }

    let nHead = head?.next
    var pLast: ListNode?, pNode = head, pNext = head?.next

    while pNode?.next != nil {
        if let last = pLast {
            last.next = pNext
        }
        pNode?.next = pNext?.next
        pNext?.next = pNode

        pLast = pNode
        pNode = pNode?.next
        pNext = pNode?.next
    }
    return nHead
}

let node6 = ListNode(6, nil)
let node5 = ListNode(5, node6)
let node4 = ListNode(4, node5)
let node3 = ListNode(3, node4)
let node2 = ListNode(2, node3)
let node1 = ListNode(1, node2)

var tmpNode = reverseList(node1)
while tmpNode != nil {
    print(tmpNode!.val)
    tmpNode = tmpNode!.next
}
