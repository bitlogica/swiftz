//
//  Array.swift
//  swiftz_core
//
//  Created by Maxwell Swadling on 3/06/2014.
//  Copyright (c) 2014 Maxwell Swadling. All rights reserved.
//

import Foundation

// Functions to make working with arrays easy.

public func pure<A>(a: A) -> [A] {
  var v = [A]()
  v.append(a)
  return v
}

// Note! This is not map! Map mutates the array, this copies it.
public func <^><A, B>(f: A -> B, a: [A]) -> [B] {
  var xs = [B]()
  for x in a {
    xs.append(f(x))
  }
  return xs
}

public func <*><A, B>(f: [(A -> B)], a: [A]) -> [B] {
  var re = [B]()
  for g in f {
    for h in a {
      re.append(g(h))
    }
  }
  return re
}

public func >>=<A, B>(a: [A], f: A -> [B]) -> [B] {
  var re = [B]()
  for x in a {
    re.extend(f(x))
  }
  return re
}
