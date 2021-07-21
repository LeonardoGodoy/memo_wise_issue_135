module ModuleWithMemowise
  module ModuleExample
    prepend MemoWise
    extend ActiveSupport::Concern

    included do
      def example_method
        false
      end
    end
  end
end
