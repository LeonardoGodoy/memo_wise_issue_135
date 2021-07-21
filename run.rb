require 'memo_wise'
require 'active_support/concern'

require_relative 'module_with_memowise/module_example'
require_relative 'module_with_memowise/prepend_before_class'
require_relative 'module_with_memowise/prepend_after_class'

require_relative 'module_without_memowise/module_example'
require_relative 'module_without_memowise/prepend_before_class'
require_relative 'module_without_memowise/prepend_after_class'

# Using a module with memowise
p ModuleWithMemowise::ModuleExample.ancestors # => [MemoWise, ModuleWithMemowise::ModuleExample]

# # Prepending before inclusion
p ModuleWithMemowise::PrependBeforeClass.ancestors # => [MemoWise, ModuleWithMemowise::ModuleExample, ModuleWithMemowise::PrependBeforeClass, Object, Kernel, BasicObject]
p ModuleWithMemowise::PrependBeforeClass.new.example_method # => true

# # Prepending alter inclusion
p ModuleWithMemowise::PrependAfterClass.ancestors # => [ModuleWithMemowise::PrependAfterClass, MemoWise, ModuleWithMemowise::ModuleExample, Object, Kernel, BasicObject]
p ModuleWithMemowise::PrependAfterClass.new.example_method # => true


# Using a module without memowise
p ModuleWithoutMemowise::ModuleExample.ancestors # => [ModuleWithoutMemowise::ModuleExample]

# Prepending before inclusion
p ModuleWithoutMemowise::PrependBeforeClass.ancestors # => [MemoWise, ModuleWithoutMemowise::PrependBeforeClass, ModuleWithoutMemowise::ModuleExample, Object, Kernel, BasicObject]
p ModuleWithoutMemowise::PrependBeforeClass.new.example_method # => true

# Prepending alter inclusion
p ModuleWithoutMemowise::PrependAfterClass.ancestors # => [MemoWise, ModuleWithoutMemowise::PrependAfterClass, ModuleWithoutMemowise::ModuleExample, Object, Kernel, BasicObject]
p ModuleWithoutMemowise::PrependAfterClass.new.example_method # => true
