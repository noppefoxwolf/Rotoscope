//
//  File.swift
//  
//
//  Created by Tomoya Hirano on 2019/10/27.
//

import Foundation

fileprivate class WeakObject<T: AnyObject>: Equatable, Hashable {

    weak var object: T?

    init(_ object: T) {
        self.object = object
    }
    
    func hash(into hasher: inout Hasher) {
        if let object = self.object {
            hasher.combine(ObjectIdentifier(object).hashValue)
        }
    }

    public static func == <T> (lhs: WeakObject<T>, rhs: WeakObject<T>) -> Bool {
        return lhs.object === rhs.object
    }
}


public class WeakObjectSet<T: AnyObject>: Sequence {

    private var _objects: Set<WeakObject<T>>
    
    public var objects: [T] {
        return self._objects.compactMap { $0.object }
    }

    public init() {
        self._objects = Set<WeakObject<T>>([])
    }

    public init(_ objects: [T]) {
        self._objects = Set<WeakObject<T>>(objects.map { WeakObject($0) })
    }

    public func contains(_ object: T) -> Bool {
        return self._objects.contains(WeakObject(object))
    }

    public func add(_ object: T) {
        self._objects.formUnion([WeakObject(object)])
    }

    public func add(_ objects: [T]) {
        self._objects.formUnion(objects.map { WeakObject($0) })
    }
    
    public func remove(_ object: T) {
        self._objects.remove(WeakObject<T>(object))
    }

    public func remove(_ objects: [T]) {
        self._objects.subtract(objects.map { WeakObject($0) })
    }

    public func makeIterator() -> WeakObjectSetIterator<T> {
        return WeakObjectSetIterator(self.objects)
    }

}


public struct WeakObjectSetIterator<T: AnyObject>: IteratorProtocol {

    private let objects: [T]
    private var index: Int = 0

    fileprivate init(_ objects: [T]) {
        self.objects = objects
    }

    mutating public func next() -> T? {
        if index < objects.count {
            defer { index += 1 }
            return objects[index]
        }
        return nil
    }

}

