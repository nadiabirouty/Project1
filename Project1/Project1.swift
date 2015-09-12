func nextCellStates(currentStates: [[Bool]]) -> [[Bool]] {
    let rows = currentStates.indices
    let columns = currentStates[0].indices
    var newMatrix = currentStates
    for row in rows{
        for col in columns{
            var neighbors = getNeighbors(currentStates, row: row, column: col)
            var numAliveNeighbors = 0
            
            for neighbor in neighbors{
                var indexR = neighbor[0]
                var indexC = neighbor[1]
                
                if currentStates[indexR][indexC]{
                    numAliveNeighbors += 1
                }
            }
            
            if currentStates[row][col]{
                if numAliveNeighbors < 2 {
                    newMatrix[row][col] = false
                } else if numAliveNeighbors > 3 {
                    newMatrix[row][col] = false
                }
            } else {
                if numAliveNeighbors == 3 {
                    newMatrix[row][col] = true
                }
            }
        }
    }
    return newMatrix
}
//returns a points valid neighors based on whether the neighbors are in the bounds of the matrix. Returns both dead and alive neighbor locations.  Takes in an m by n matrix and a valid point p in this matrix.
//Boundaries: [0, m] for row and [0, n] for column
func getNeighbors(matrix: [[Bool]], row: Int, column: Int) -> [[Int]] {
    let m = matrix.endIndex - 1
    let n = matrix[0].endIndex - 1
   
    var neighbors = [[Int]]()
    
    if (row - 1) >= 0{
        neighbors.append([row-1, column])
        if (column - 1) >= 0{
            neighbors.append([row-1, column-1])
        }
        if (column + 1) <= n{
            neighbors.append([row-1, column+1])
        }
    }
    if (row + 1) <= m{
        neighbors.append([row+1, column])
        if (column - 1) >= 0{
            neighbors.append([row+1, column-1])
        }
        if (column + 1) <= n{
            neighbors.append([row+1, column+1])
        }
    }
    if (column - 1) >= 0{
        neighbors.append([row, column-1])
    }
    if (column + 1) <= n{
        neighbors.append([row, column+1])
    }
    return neighbors
}

class LRUCache<K:Hashable, V> {
    private var capacity: Int
    private var arrayKeyLastUsed: [K]
    
    private var structure: Dictionary<K, V>
    
    init(capacity: Int) {
        self.capacity = capacity
        self.structure =  [K: V]()
        self.arrayKeyLastUsed = Array<K>()
    }

    /*
    *  Get the value of the key if the key exists in the cache, otherwise return nil.
    */
    func get(k: K) -> V? {
        self.arrayKeyLastUsed.insert(k, atIndex: 0)
        for (key, value) in self.structure {
            if key == k {
                return value
            }
        }
        return nil
    }
    
    /*
    * Set or insert the value if the key is not already present.
    * When the cache reached its capacity, it should invalidate the
    * least recently used item before inserting a new item.
    */
    func set(k: K, v: V) {
        if capacity > 0{
            if self.structure.count >= capacity{
                self.structure.removeValueForKey(arrayKeyLastUsed[0])
                self.arrayKeyLastUsed.removeAtIndex(0)
            }
            structure.updateValue(v, forKey: k)
            self.arrayKeyLastUsed.append(k)
        }
    }
}
