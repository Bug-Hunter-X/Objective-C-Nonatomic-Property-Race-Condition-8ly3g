To fix the race condition, we'll use `@synchronized` to ensure that only one thread accesses the `dataArray` at a time:

```objectivec
@property (nonatomic, strong) NSMutableArray *dataArray;

- (void)addData:(id)object {
    @synchronized(self.dataArray) {
        [self.dataArray addObject:object];
    }
}

- (void)removeData:(id)object {
    @synchronized(self.dataArray) {
        [self.dataArray removeObject:object];
    }
}
```

This solution uses the `dataArray` itself as the lock object.  Alternatively, a separate lock object could be used for better control.  Note that this is just one way to handle the problem.  For more complex scenarios, consider using more sophisticated synchronization techniques, such as GCD or dispatch semaphores, to improve performance and avoid potential deadlocks.