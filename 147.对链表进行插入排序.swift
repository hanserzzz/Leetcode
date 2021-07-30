/*
 147. 对链表进行插入排序
 对链表进行插入排序。

 插入排序的动画演示如上。从第一个元素开始，该链表可以被认为已经部分排序（用黑色表示）。
 每次迭代时，从输入数据中移除一个元素（用红色表示），并原地将其插入到已排好序的链表中。

 插入排序算法：

 插入排序是迭代的，每次只移动一个元素，直到所有元素可以形成一个有序的输出列表。
 每次迭代中，插入排序只从输入数据中移除一个待排序的元素，找到它在序列中适当的位置，并将其插入。
 重复直到所有输入数据插入完为止。

 示例 1：

 输入: 4->2->1->3
 输出: 1->2->3->4
 示例 2：

 输入: -1->5->3->4->0
 输出: -1->0->3->4->5

 */

public class ListNode {
    public var val: Int
    public var next: ListNode?

    public init(_ val: Int) {
        self.val = val
        next = nil
    }
}

func insertionSortList(_ head: ListNode?) -> ListNode? {
    guard let _head = head, _head.next != nil else {
        return head
    }

    // 辅助头
    let h = ListNode(0)
    h.next = head
    var cur = head, sortedLast = head
    while cur != nil {
        if cur!.val >= sortedLast!.val {
            sortedLast = cur
            cur = cur?.next
        } else {
            var prev = h
            while prev.next!.val <= cur!.val {
                prev = prev.next!
            }

            let next = prev.next
            prev.next = cur
            sortedLast?.next = cur?.next
            cur?.next = next
            cur = sortedLast?.next
        }
    }

    return h.next
}

let node1 = ListNode(2)
let node2 = ListNode(6)
let node3 = ListNode(9)
let node4 = ListNode(5)
let node5 = ListNode(1)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

var tmp = insertionSortList(node1)
while tmp != nil {
    print(tmp!.val)
    tmp = tmp?.next
}
