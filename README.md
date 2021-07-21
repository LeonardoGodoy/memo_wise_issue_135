# Memowise issue 135

This repository was created to investigate a curious situation on the [memowise gem](https://github.com/panorama-ed/memo_wise) where prepending memowise module was supposedly changing behavior based on its position.

You can read the issue description [right here](https://github.com/panorama-ed/memo_wise/issues/135)


### Test process
Since the base code provided was not running, and the description wasn't exactly clear if prepending the Memowise module was done at the same time by the class and its example module, I decided to test all combinations.
That's why you are going to find two main modules, one considering that memowise was included on the example module and another that does not.

The [code provided](/issue_exemple.rb) was also included on the repo.

#### Using a module with memowise

```ruby
p ModuleWithMemowise::ModuleExample.ancestors # => [MemoWise, ModuleWithMemowise::ModuleExample]

# Prepending before inclusion
p ModuleWithMemowise::PrependBeforeClass.ancestors # => [MemoWise, ModuleWithMemowise::ModuleExample, ModuleWithMemowise::PrependBeforeClass, Object, Kernel, BasicObject]
p ModuleWithMemowise::PrependBeforeClass.new.example_method # => true

# Prepending alter inclusion

# (that is the special scenario apparently. The memosise does not prepend the class. But the ModuleExample instead)

p ModuleWithMemowise::PrependAfterClass.ancestors # => [ModuleWithMemowise::PrependAfterClass, MemoWise, ModuleWithMemowise::ModuleExample, Object, Kernel, BasicObject]

p ModuleWithMemowise::PrependAfterClass.new.example_method # => true

```

#### Using a module without memowise

Everything looks normal

```ruby
p ModuleWithoutMemowise::ModuleExample.ancestors # => [ModuleWithoutMemowise::ModuleExample]

# Prepending before inclusion
p ModuleWithoutMemowise::PrependBeforeClass.ancestors # => [MemoWise, ModuleWithoutMemowise::PrependBeforeClass, ModuleWithoutMemowise::ModuleExample, Object, Kernel, BasicObject]
p ModuleWithoutMemowise::PrependBeforeClass.new.example_method # => true

# Prepending alter inclusion
p ModuleWithoutMemowise::PrependAfterClass.ancestors # => [MemoWise, ModuleWithoutMemowise::PrependAfterClass, ModuleWithoutMemowise::ModuleExample, Object, Kernel, BasicObject]
p ModuleWithoutMemowise::PrependAfterClass.new.example_method # => true

```


### Run the tests
To do that, you only need to execute the following:
```
ruby run.rb
```


### Conclusion
Even though one of the scenarios caused a curious sequence of ancestors, the tests ran could not simulate the same behavior pointed out on the issue.
In all the cases, the memowised method returned 'true' as expected.

The scenario to be investigated is the following:
Using the module with memowise, and the class prepending memowise after the module inclusion.
The ancestor's chain ends up with the memowise module prepending the module instead of the class. (Check /run:20)

The tests were executed using:
- ruby 2.6.3
- memo_wise 1.0.0
- activesupport 6.1.4
