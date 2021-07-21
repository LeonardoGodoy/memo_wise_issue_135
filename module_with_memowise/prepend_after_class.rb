module ModuleWithMemowise
  class PrependAfterClass
    include ModuleExample
    prepend MemoWise # This line added

    def example_method
      true
    end
    memo_wise :example_method
  end
end
