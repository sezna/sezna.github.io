---
title: "The RAII Pattern's Advantages in Rust: An Elementary Overview"
date: 2020-04-05T09:24:36-08:00
draft: true
---

Resource Acquisition is Initialization, or RAII, is a design pattern that became prevelant alongside object oriented programming. It is easy to see why: resource acquisition is logically isomorphic to the constructor, or similar, of an object. A more functional mindset could identify this behavior as a _side effect_, but philosophically that is up for debate. Can't the object itself imply that behavior? We must link to the "real world" at some point.

___

RAII has special benefits when used in Rust. While Rust isn't strictly object oriented, the aspects of object orientation which make RAII effective are still present. Let's take a look at the traditional problems one has to consider when writing a RAII pattern:

1. The acquisition (creation or pass-by-value) of the object should represent the initialization or access of the underlying resource.
1. Copies of the object must represent individual connections to the underlying resource
1. Related to point 2, implicit copies can result in exhaustion of the underlying resource
1. The object must handle de-initialization and cleanup of the underlying resource
1. The references to the underlying resources must live at least as long as the object

All of these problems are addressed at compile-time in Rust. 

> The acquisition of the object should represent the initialization or access of the underlying object

RAII objects are, in Rust, coded as structs. The canonical example is the [Mutex](https://github.com/rust-unofficial/patterns/blob/master/patterns/RAII.md). 

```rust
struct Mutex<T> {
  data: T
} 
```

The fact that `T` is _not_ a reference means that this `Mutex` _owns_ that data. The lifetime of `T` is tied directly to the lifetime of its containing `Mutex`. There can be no reference to `T` that outlives that `Mutex`. This is part of the concept of [ownership](https://doc.rust-lang.org/nomicon/ownership.html) that is one of Rust's pillars of novelty. This has an advantage: `Mutex` can distribute references to `T` without giving up control of `T`, and `Mutex` gets to determine who is allowed to mutate `T` and who isn't. So, by virtue of creating a `Mutex<T>`, whatever previously held this `T` _must_ relegate control of it to `Mutex`, and this enforces, at compile-time, the RAII struct acquiring the underlying resource. 

If the RAII struct were to initialize the resource instead of acquiring it, like a database connection RAII struct, then it would simply create the resource in its constructor method (often `new()` or `connect()`), and ownership would remain with it from the inception of the resource.

> Copies of the object must represent individual connections to the underlying resource

In general, dealing with the subtleties of implicit (or even explicit) memory clones can be challenging for the RAII struct. For example, consider a struct which connects to a stream and provides methods to read from that stream:

```rust
struct StreamConnection {
  path: Uri,
  connectionState: ConnectionState,
  ...
}

impl StreamConnection {
  pub fn read(&mut self) -> Vec<u8> {
    ...
  }
}
```

Now, consider you have a `StreamConnection` and it gets cloned, either accidentally and implicitly or otherwise. Does reading from one of them change how the other one will behave? I.e., if the stream is the natural numbers, and you read `1, 2, 3` from the first one, will the second stream subsequently read `4, 5, 6`? Essentially, are there two mutable references to the same stream?

In some languages, you may have to do some tricky things to avoid this situation. In Rust, you can control the scope of allowable memory copies of your struct. You can, at compile-time, either: 
* disallow cloning of `StreamConnection` 
* allow cloning, but ensure that it sets up a new stream


