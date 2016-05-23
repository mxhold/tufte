module Tufte
  module InstanceVariableBinding
    def self.new(instance_variables)
      InstanceVariables.new(instance_variables).get_binding
    end

    class InstanceVariables
      def initialize(instance_variables)
        instance_variables.each do |name, value|
          instance_variable_set(name, value)
        end
      end

      def get_binding
        binding
      end
    end
  end
end
