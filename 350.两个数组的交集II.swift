/*
350. 两个数组的交集 II
给你两个整数数组 nums1 和 nums2 ，请你以数组形式返回两数组的交集。返回结果中每个元素出现的次数，应与元素在两个数组中都出现的次数一致（如果出现次数不一致，则考虑取较小值）。可以不考虑输出结果的顺序。

 

示例 1：

输入：nums1 = [1,2,2,1], nums2 = [2,2]
输出：[2,2]
示例 2:

输入：nums1 = [4,9,5], nums2 = [9,4,9,8,4]
输出：[4,9]
 

提示：

1 <= nums1.length, nums2.length <= 1000
0 <= nums1[i], nums2[i] <= 1000
*/



func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
	if nums1.count == 0 || nums2.count == 0 { return [] }

	let count1 = nums1.count
	let count2 = nums2.count
	let _nums1 = nums1.sorted()
	let _nums2 = nums2.sorted()

	var res = [Int]()
	var idx1 = 0, idx2 = 0
	while idx1 < count1 && idx2 < count2 {
		if _nums1[idx1] == _nums2[idx2] {
			res.append(_nums1[idx1])
			idx1 += 1
			idx2 += 1
		} else {
			if _nums1[idx1] > _nums2[idx2] {
				idx2 += 1
			} else {
				idx1 += 1
			}
		}
	}
	return res
}

let nums1 = [1,2,2,1], nums2 = [2,2]
let res = intersect(nums1, nums2)
print(res)






