/*
 对单链表进行快排

 */

public class ListNode {
    public var val: Int
    public var next: ListNode?

    public init(_ val: Int) {
        self.val = val
        next = nil
    }
}

func sort(_ begin: ListNode?, _ end: ListNode?) -> ListNode? {
    if begin === end {
        return begin
    }
    let val = begin!.val
    var lNode = begin, rNode = begin?.next
    while rNode !== end?.next {
        if rNode!.val < val {
            lNode = lNode?.next
            (rNode!.val, lNode!.val) = (lNode!.val, rNode!.val)
        }
        rNode = rNode?.next
    }
//    print("begin",begin!.val, lNode!.val)
    (lNode!.val, begin!.val) = (begin!.val, lNode!.val)
    return lNode
}

func quickSort(_ begin: ListNode?, _ end: ListNode?) {
    if begin == nil || end == nil { return }
    if begin !== end {
        let node = sort(begin, end)
        quickSort(begin, node)
        quickSort(node?.next, end)
    }
}
