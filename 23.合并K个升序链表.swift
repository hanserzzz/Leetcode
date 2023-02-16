/**
 23. 合并K个升序链表
 给你一个链表数组，每个链表都已经按升序排列。

 请你将所有链表合并到一个升序链表中，返回合并后的链表。

  

 示例 1：

 输入：lists = [[1,4,5],[1,3,4],[2,6]]
 输出：[1,1,2,3,4,4,5,6]
 解释：链表数组如下：
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 将它们合并到一个有序链表中得到。
 1->1->2->3->4->4->5->6
 示例 2：

 输入：lists = []
 输出：[]
 示例 3：

 输入：lists = [[]]
 输出：[]
  

 提示：

 k == lists.length
 0 <= k <= 10^4
 0 <= lists[i].length <= 500
 -10^4 <= lists[i][j] <= 10^4
 lists[i] 按 升序 排列
 lists[i].length 的总和不超过 10^4
 
 
思路：
    1.合并两个有序链表
    2.遍历lists,两两合并
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = nil }
}

func merge(_ n1: ListNode?, _ n2: ListNode?) -> ListNode? {
    if n1 == nil { return n2 }
    if n2 == nil { return n1 }
    
    let head = ListNode(0)
    var iter: ListNode? = head
    var iter1 = n1, iter2 = n2
    while let _iter1 = iter1, let _iter2 = iter2 {
        if _iter1.val < _iter2.val {
            iter?.next = _iter1
            iter1 = _iter1.next
        } else {
            iter?.next = _iter2
            iter2 = _iter2.next
        }
        iter = iter?.next
    }

    if let _iter1 = iter1 {
        iter?.next = _iter1
    }

    if let _iter2 = iter2 {
        iter?.next = _iter2
    }
    return head.next
}

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    var head: ListNode?
    for list in lists {
        head = merge(head, list)
    }
    return head
}
