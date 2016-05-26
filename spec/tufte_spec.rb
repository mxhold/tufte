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

  describe Tufte::Helpers do
    describe "#sidenote" do
      it "generates HTML for a sidenote" do
        result = Tufte::Helpers.sidenote("my-sn", "I'm a sidenote.")
        expect(result).to eql <<-HTML.chomp
<label for="my-sn" class="margin-toggle sidenote-number"></label>
<input type="checkbox" id="my-sn" class="margin-toggle"/>
<span class="sidenote">
I'm a sidenote.
</span>
        HTML
      end
    end

    describe "#marginnote" do
      it "generates HTML for a marginnote" do
        result = Tufte::Helpers.marginnote("my-mn", "Margin note.")
        expect(result).to eql <<-HTML.chomp
<label for="my-mn" class="margin-toggle">&#8853;</label>
<input type="checkbox" id="my-mn" class="margin-toggle"/>
<span class="marginnote">
Margin note.
</span>
        HTML
      end
    end
  end
end
