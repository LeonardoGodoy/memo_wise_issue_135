module ModuleWithoutMemowise
  class PrependBeforeClass
    prepend MemoWise # This line added
    include ModuleExample

    def example_method
      true
    end
    memo_wise :example_method
  end
end
