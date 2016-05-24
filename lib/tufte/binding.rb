module Tufte
  module Binding
    def self.new(instance_variables:, methods:)
      BindingFactory.new(
        instance_variables: instance_variables,
        methods: methods,
      ).get_binding
    end

    class BindingFactory
      def initialize(instance_variables:, methods:)
        instance_variables.each do |name, value|
          instance_variable_set(name, value)
        end
        methods.each do |name, body|
          define_singleton_method(name, body)
        end
      end

      def get_binding
        binding
      end
    end
  end
end
