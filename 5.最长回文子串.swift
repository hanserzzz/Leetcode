/*
5. 最长回文子串
给你一个字符串 s，找到 s 中最长的回文子串。

 

示例 1：

输入：s = "babad"
输出："bab"
解释："aba" 同样是符合题意的答案。
示例 2：

输入：s = "cbbd"
输出："bb"
示例 3：

输入：s = "a"
输出："a"
示例 4：

输入：s = "ac"
输出："a"
 

提示：

1 <= s.length <= 1000
s 仅由数字和英文字母（大写和/或小写）组成

思路:
	一次循环，以当前index值所在的字符为中心点或者偏左点，向左向右扩散，判断最大回文子串，得出当前中心点最大回文串之后更新答案
*/

func maxPalind(_ left: Int, _ right: Int, _ chars: [Character]) -> (Int, Int) {

	var l = left, r = right
	while l >= 0 && r < chars.count && chars[r] == chars[l] {
		l -= 1
		r += 1
	}

	return (l + 1, r - 1)
}

func longestPalindrome(_ s: String) -> String {
	let chars = [Character](s)
	var start = 0, end = 0
	for i in 0..<chars.count {
		let tuple1 = maxPalind(i, i, chars)
		let tuple2 = maxPalind(i, i + 1, chars)
		if tuple1.1 - tuple1.0 > end - start {
			start = tuple1.0
			end = tuple1.1
		}

		if tuple2.1 - tuple2.0 > end - start {
			start = tuple2.0
			end = tuple2.1
		}
	}
	return String(chars[start...end])
}


let s = "bb"
print(longestPalindrome(s))




