require "spec_helper"

module Tufte
  RSpec.describe Binding do
    it "returns a binding with instance variables and methods" do
      some_binding = Binding.new(
        instance_variables: { :@foo => "bar" },
        mod: Module.new do
          def self.add(a, b)
            a + b
          end
        end
      )
      expect(some_binding.eval("instance_variables")).to eql [:@foo]
      expect(some_binding.eval("@foo")).to eql "bar"
      expect(some_binding.eval("add(1, 2)")).to eql 3
    end
  end
end
