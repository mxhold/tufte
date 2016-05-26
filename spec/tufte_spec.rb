require "spec_helper"

describe Tufte do
  it "has a version number" do
    expect(Tufte::VERSION).not_to be nil
  end

  describe ".render" do
    it "renders ERB given instance variables" do
      result = Tufte.render("Hello, <%= @thing %>!", :@thing => "World")
      expect(result).to eql "Hello, World!"
    end

    it "renders ERB given instance variables and helpers" do
      result = Tufte.render(
        "<%= add(@a, 2) %>!",
        { :@a => 1 },
        Module.new do
          def self.add(a, b)
            a + b
          end
        end
      )
      expect(result).to eql "3!"
    end
  end
end
