require "spec_helper"

module Tufte
  RSpec.describe InstanceVariableBinding do
    it "returns a binding with instance variables set" do
      some_binding = InstanceVariableBinding.new(:@foo => "bar")
      expect(some_binding.eval("instance_variables")).to eql [:@foo]
      expect(some_binding.eval("@foo")).to eql "bar"
    end
  end
end
