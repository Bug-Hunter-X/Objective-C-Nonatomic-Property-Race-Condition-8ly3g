In Objective-C, a common yet subtle issue arises from the interaction between properties declared with `nonatomic` and concurrent access.  Consider this scenario:

```objectivec
@property (nonatomic, strong) NSMutableArray *dataArray;

- (void)addData:(id)object {
    [self.dataArray addObject:object];
}

- (void)removeData:(id)object {
    [self.dataArray removeObject:object];
}
```

If multiple threads call `addData` and `removeData` concurrently without proper synchronization (like using `@synchronized` or a dispatch semaphore), data corruption or crashes can occur.  The `nonatomic` attribute prevents the compiler from generating atomic accessors, which leads to race conditions. The problem is not always immediately apparent due to non-deterministic behaviour, it might show itself under only certain conditions like heavy loads.