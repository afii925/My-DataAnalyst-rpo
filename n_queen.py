def is_safe(board, row, col, n):
    
    for i in range(row):
        if board[i] == col or \
           board[i] - i == col - row or \
           board[i] + i == col + row:
            return False
    return True

def solve_n_queens_util(board, row, n):
    if row == n:
        return True 

    for col in range(n):
        if is_safe(board, row, col, n):
            board[row] = col 
            if solve_n_queens_util(board, row + 1, n):  
                return True
            board[row] = -1 
    return False  

def solve_n_queens(n):
    board = [-1] * n 
    if solve_n_queens_util(board, 0, n):
        return board
    else:
        return None  
def print_solution(board):
    n = len(board)
    for row in range(n):
        line = ['Q' if col == board[row] else '.' for col in range(n)]
        print(" ".join(line))
    print()


n = 8  
solution = solve_n_queens(n)
if solution:
    print_solution(solution)
else:
    print("No solution found.")
