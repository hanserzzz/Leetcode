/*
61. 旋转链表
给你一个链表的头节点 head ，旋转链表，将链表每个节点向右移动 k 个位置。

 

示例 1：


输入：head = [1,2,3,4,5], k = 2
输出：[4,5,1,2,3]
示例 2：


输入：head = [0,1,2], k = 4
输出：[2,0,1]
 

提示：

链表中节点的数目在范围 [0, 500] 内
-100 <= Node.val <= 100
0 <= k <= 2 * 109

*/


func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    // 筛选条件
    if k == 0 || head == nil || head?.next == nil { return head }

    // 遍历链表，记录节点个数，并找到尾结点
    var n = 1
    var iter = head
    while let _iter = iter, _iter.next != nil {
        n += 1
        iter = _iter.next
    }

    // 处理要旋转的节点
    var _k = n - k % n 
    if _k == n { 
        return head
    }

    // 需要旋转，链接原来头尾节点
    iter?.next = head

    // 根据要计算出的位置找到旋转节点的前一个节点
    while _k > 0 {
        _k -= 1
        iter = iter?.next
    }
    // 重置尾部节点，确认头部节点
    let ret = iter?.next
    iter?.next = nil

    return ret
}