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
  end
end
