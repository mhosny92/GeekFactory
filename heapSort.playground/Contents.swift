//: Playground - noun: a place where people can play


//var arr = [10,12,3,4,8,5,6,1]
var arr = ["avatar","lord of the rings","transformers","the hobbit","harry potter","titanic"]

/*
 Function to build a heap tree out of the specified array
 */

func buildMaxHeap<T: Comparable>(array: Array<T>) -> Array<T>{
    var heapArray = Array<T>()
    heapArray.append(array[0])
    heapArray.append(contentsOf: array)
    var size = array.count/2
    while size>0{
        heapArray = maxHeapify(heapArray: heapArray,index: size)
        size -= 1
    }
    heapArray.remove(at: 0)
    return heapArray
}

/*
 Puts the elements of the heap in max-heap order
 */

func maxHeapify<T: Comparable>(heapArray: Array<T>, index: Int) -> Array<T>{
    var mutableArray = Array<T>()
    mutableArray.append(contentsOf: heapArray)
    let left = index * 2
    let right = left + 1
    var largest: Int = index
    if (left < mutableArray.count && mutableArray[left] > mutableArray[index]){
        largest = left
    }
    if (right < mutableArray.count && mutableArray[right] > mutableArray[largest])
    {
        largest = right
    }
    if (largest != index){
        swap(&mutableArray[index], &mutableArray[largest])
        mutableArray = maxHeapify(heapArray: mutableArray, index: largest)
    }
    return mutableArray
    
}

/*
 Executes heapsort of O(nlogn) on the specified array
 */

func heapSort<T: Comparable>(array: Array<T>)->Array<T>{
    
    var index = array.count
    var mutableArray = Array<T>()
    mutableArray.append(array[0])
    mutableArray.append(contentsOf: array)
    
    var sortedArray = Array<T>()
    while index > 1 {
        swap(&mutableArray[index], &mutableArray[1])
        sortedArray.append(mutableArray[index])
        mutableArray.remove(at: index)
        mutableArray = maxHeapify(heapArray: mutableArray, index: 1)
        index -= 1
    }
    sortedArray.append(mutableArray[1])
    return sortedArray
}

arr = buildMaxHeap(array: arr)
arr = heapSort(array: arr)
print(arr)
