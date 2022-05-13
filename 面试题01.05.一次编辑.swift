/**
面试题 01.05. 一次编辑
字符串有三种编辑操作:插入一个字符、删除一个字符或者替换一个字符。 给定两个字符串，编写一个函数判定它们是否只需要一次(或者零次)编辑。

 

示例 1:

输入: 
first = "pale"
second = "ple"
输出: True
 

示例 2:

输入: 
first = "pales"
second = "pal"
输出: False

*/


func oneEditAway(_ first: String, _ second: String) -> Bool {

	let count1 = first.count
	let count2 = second.count
	// 只有first、second相差小于等于1的时候才符合条件
	if abs(count1 - count2) > 1 { return false }

	var a_first = Array(first)
	var a_second = Array(second)
	if count1 < count2 {
		a_first = Array(second)
		a_second = Array(first)
	}

	let count = min(count1, count2)
	var i = 0
	while i < count {
		if a_first[i] != a_second[i] {
		// 相同个数，有一个位置不同就不符合
			if count1 == count2 { 
				var j = i + 1
				while j < count {
					if a_first[j] != a_second[j] { return false }
					j += 1
				}
				return true 
			} else {
				// 去除长的这个不同的，对冲剩下的
				var j = i
				while j < count {
					if a_first[j + 1] != a_second[j] { return false }
					j += 1
				}
				return true
			}
		}
		i += 1
	}

	return true
}

let r = oneEditAway("a", "b")
print(r)