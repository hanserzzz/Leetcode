/**
 翻转一个栈不用任何容器类型

 思路：
 	1.递归把第一个插到最后一个
 	2.递归调用插入到最后一个
 */

func insertToBottom(_ stack: inout [Int], _ target: Int) {
    if stack.count == 0 {
        stack.insert(target, at: 0)
        return
    }

    let temp = stack.removeFirst()
    insertToBottom(&stack, target)
    stack.insert(temp, at: 0)
}

func reverse(_ stack: inout [Int]) {
    if stack.count == 1 {
        return
    }

    let temp = stack.removeFirst()
    reverse(&stack)
    insertToBottom(&stack, temp)
}

var arr = [1, 2, 3, 4]
// insertToBottom(&arr, 5)
reverse(&arr)
print(arr)
