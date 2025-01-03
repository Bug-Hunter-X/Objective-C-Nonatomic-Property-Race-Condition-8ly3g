# Objective-C Nonatomic Property Race Condition

This repository demonstrates a common, yet often difficult-to-debug, issue in Objective-C: race conditions caused by concurrent access to `nonatomic` properties.  The example showcases how multiple threads accessing and modifying the same `NSMutableArray` without proper synchronization can lead to data corruption or unexpected crashes.

The `bug.m` file contains the problematic code.  The `bugSolution.m` file presents a solution using `@synchronized` to protect the array from race conditions.  Note that other synchronization mechanisms, such as dispatch semaphores or GCD, are also viable solutions.

This example emphasizes the importance of carefully considering thread safety when working with mutable objects and nonatomic properties in Objective-C.