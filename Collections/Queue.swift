//
//  Queue.swift
//  Collections
//
//  Created by Uji Saori on 2021-03-16.
//

import Foundation

public final class Queue<E> : Sequence {
    /// First and last elements of Queue
    private var first: Node<E>? = nil
    private var last: Node<E>? = nil
    
    /// Number of elements in Queue
    private(set) var count: Int = 0
    
    /// Helper linked list node class
    fileprivate class Node<E> {
        fileprivate var item: E
        fileprivate var next: Node<E>?
        fileprivate init(item: E, next: Node<E>? = nil) {
            self.item = item
            self.next = next
        }
    }
    
    /// Initializes an empty Queue
    public init() { }
    
    /// Returns true if this queue is empty
    /// - Returns: true if this queue is empty, otherwise false
    public func isEmpty() -> Bool {
        return first == nil && last == nil
    }
    
    /// Adds the item to this queue (last)
    /// - Parameter item: the item to add to this queue
    public func enqueue(item: E) {
        let oldLast = last
        last = Node<E>(item: item)
        oldLast?.next = last
        count += 1
        if first == nil {
            first = last
        }
    }
    
    /// Removes the first element of this queue
    /// - Returns: the removed item
    public func dequeue() -> E? {
        let oldFirst = first
        first = oldFirst?.next
        count -= 1
        return oldFirst?.item
    }
    
    /// Returns the first element of this queue
    /// - Returns: the first element of this queue
    public func peek() -> E? {
        return first?.item
    }
    
    public struct QueueIterator<E> : IteratorProtocol {
        public typealias Element = E
        
        private var current: Node<E>?
        
        fileprivate init(_ first: Node<E>?) {
            self.current = first
        }
        
        public mutating func next() -> E? {
            if let item = current?.item {
                current = current?.next
                return item
            } else {
                return nil
            }
        }
    }
    
    /// Returns an iterator that iterates over the items in this queue in reverse order
    public func makeIterator() -> QueueIterator<E> {
        return QueueIterator<E>(first)
    }
}

extension Queue: CustomStringConvertible {
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1), " }
    }
}
