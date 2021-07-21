module ModuleWithoutMemowise
  module ModuleExample
    extend ActiveSupport::Concern

    included do
      def example_method
        false
      end
    end
  end
end
