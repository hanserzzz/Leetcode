/*

200. 岛屿数量
给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。

岛屿总是被水包围，并且每座岛屿只能由水平方向和/或竖直方向上相邻的陆地连接形成。

此外，你可以假设该网格的四条边均被水包围。

 

示例 1：

输入：grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]
输出：1
示例 2：

输入：grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
输出：3
 

提示：

m == grid.length
n == grid[i].length
1 <= m, n <= 300
grid[i][j] 的值为 '0' 或 '1'


思路:
	1.深度优先遍历


*/

func dfs(_ grid: inout [[Character]], _ h: Int, _ l: Int) {
	let _h = grid.count, _l = grid[0].count
	grid[h][l] = "0"
	if h - 1 >= 0 && grid[h - 1][l] == "1" { dfs(&grid, h - 1, l) }
	if h + 1 < _h && grid[h + 1][l] == "1" { dfs(&grid, h + 1, l) }
	if l - 1 >= 0 && grid[h][l - 1] == "1" { dfs(&grid, h, l - 1) }
	if l + 1 < _l && grid[h][l + 1] == "1" { dfs(&grid, h, l + 1) }
}

func numIslands(_ grid: [[Character]]) -> Int {
	var _grid = grid
	let h = grid.count, l = grid[0].count 

	var _numIslands = 0
	for i in 0..<h {
		for j in 0..<l {
			if _grid[i][j] == "1" {
				_numIslands += 1
				dfs(&_grid, i, j)
			}
		}
	}
	return _numIslands
}










