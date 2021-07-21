require 'memo_wise'
require "active_support/concern"

module ExampleModule
  prepend MemoWise
  extend ActiveSupport::Concern

  included do
    def example_method
      false
    end
  end
end

class ExampleClass
  include ExampleModule

  def example_method
    true
  end
  memo_wise :example_method
end

# memo_wise_issue.rb:21:in `<class:ExampleClass>': undefined method `memo_wise' for ExampleClass:Class (NoMethodError)
