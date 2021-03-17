//
//  Stack.swift
//  Collections
//
//  Created by Uji Saori on 2021-03-16.
//

import Foundation

public final class Stack<E> : Sequence {
    /// First element of Stack
    private var first: Node<E>? = nil
    
    /// Number of elements in Stack
    private(set) var count: Int = 0
    
    /// helper linked list node class
    fileprivate class Node<E> {
        fileprivate var item: E
        fileprivate var next: Node<E>?
        fileprivate init(item: E, next: Node<E>? = nil) {
            self.item = item
            self.next = next
        }
    }
    
    /// Initializes an empty stack
    public init() { }
    
    /// Returns true if this stack is empty
    /// - Returns: true if this stack is empty, otherwise false
    public func isEmpty() -> Bool {
        return first == nil
    }
    
    /// Adds the item to this stack (first)
    /// - Parameter item: the item to add to this stack
    public func push(item: E) {
        let oldFirst = first
        first = Node<E>(item: item, next: oldFirst)
        count += 1
    }
    
    /// Removes the first element of this queue
    /// - Returns: the removed item
    public func pop() -> E? {
        let oldFirst = first
        let newFirst = first?.next
        first = newFirst
        count -= 1
        return oldFirst?.item
    }
    
    /// Returns the first element of this stack
    /// - Returns: the first element of this stack
    public func peek() -> E? {
        return first?.item
    }
    
    public struct StackIterator<E> : IteratorProtocol {
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
    
    /// Returns an iterator that iterates over the items in this stack in reverse order
    public func makeIterator() -> StackIterator<E> {
        return StackIterator<E>(first)
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1), " }
    }
}
