//
//  Bag.swift
//  Collections
//
//  Created by Uji Saori on 2021-03-16.
//

import Foundation

// should be public as an API
// public : can NOT subclass, can access outside of module
// open   : can subclass
// final  : can NOT subclass <- as convention, put final to disable subclass
// E : stands for Element

/// **Bag** claass represents a bag of generic items.
/// It supports insertion and iteration over the items in arbitary order.
/// This implementation uses a singly linked list with an inner class Node.
/// The *add*, *isEmpty*, and *count* operations take constant time *O(1)*. Iteration takes linear time *O(n)*.
public final class Bag<E> : Sequence {
    /// First element of Bag
    private var first: Node<E>? = nil
    
    // setter is private, getter is public
    /// Number of elements in Bag
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
    
    // make sure to be public
    /// Initializes an empty bag.
    public init() {
        // nothing to do for init: it will be empty Node with 'first' and 'count'
    }
    
    
    /// Returns true if this bag is empty.
    /// - Returns: true if this bag is empty, otherwise false.
    public func isEmpty() -> Bool {
        return first == nil // <-- instead of return count == 0
    }
    
    
    // <new element> -> <older first> -> <first's next>
    /// Adds the item to this bag (front)
    /// - Parameter item: the item to add to this bag
    public func add(item: E) {
        let oldFirst = first
        first = Node<E>(item: item, next: oldFirst)
        count += 1
    }
    
    
    // Iterator
    public struct BagIterator<E> : IteratorProtocol {
        public typealias Element = E    // <- associatedtype in IteratorProtocol
        
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
    
    // for Sequence protocol
    /// Returns an iterator that iterates over the items in this bag in reverse order
    public func makeIterator() -> BagIterator<E> {
        return BagIterator<E>(first)
    }
}

// fileprivate: extension can accesses from inside the same file
extension Bag: CustomStringConvertible {
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1), " }
    }
}
