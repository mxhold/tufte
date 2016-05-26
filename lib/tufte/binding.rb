module Tufte
  module Binding
    def self.new(instance_variables:, mod:)
      BindingFactory.new(
        instance_variables: instance_variables,
        mod: mod,
      ).get_binding
    end

    class BindingFactory
      def initialize(instance_variables:, mod:)
        instance_variables.each do |name, value|
          instance_variable_set(name, value)
        end
        mod.singleton_methods.each do |name|
          define_singleton_method(name, &mod.singleton_method(name))
        end
      end

      def get_binding
        binding
      end
    end
  end
end
