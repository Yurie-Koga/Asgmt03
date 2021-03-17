//
//  main.swift
//  Collections
//
//  Created by Uji Saori on 2021-03-16.
//

import Foundation

// 1. Bag
print("===== Bag =====")
let bag = Bag<Int>()
bag.add(item: 10)
bag.add(item: 20)
bag.add(item: 30)
print("count: \(bag.count)")
for item in bag {
    print(item)
}
print("items: \(bag)")


// 2. Stack
print("\n\n===== Stack =====")
let stack = Stack<Int>()
stack.push(item: 10)
stack.push(item: 20)
stack.push(item: 30)
print("count: \(stack.count)")
for item in stack {
    print(item)
}
print("items: \(stack)")
if let peek = stack.peek() {
    print("peek: \(peek)")
}
if let pop = stack.pop() {
    print("pop: \(pop)")
}
print("items: \(stack)")
if let peek = stack.peek() {
    print("peek: \(peek)")
}


// 3. Queue
print("\n\n===== Queue =====")
let queue = Queue<Int>()
queue.enqueue(item: 10)
queue.enqueue(item: 20)
queue.enqueue(item: 30)
print("count: \(queue.count)")
for item in queue {
    print(item)
}
print("items: \(queue)")
if let peek = queue.peek() {
    print("peek: \(peek)")
}
if let dequeue = queue.dequeue() {
    print("dequeue: \(dequeue)")
}
print("items: \(queue)")
if let peek = queue.peek() {
    print("peek: \(peek)")
}
