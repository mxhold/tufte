require "spec_helper"

module Tufte
  RSpec.describe Markdown do
    describe "#to_html" do
      it "renders the markdown as html" do
        markdown = "# This is my h1\n*bold*\n"
        html = Markdown.new(markdown).to_html
        expect(html).to eql "<h1>This is my h1</h1>\n\n<p><em>bold</em></p>\n"
      end

      it "does syntax highlighting" do
        markdown = <<-RUBY
Here's some Ruby:

```ruby
Foo.bar
```
        RUBY
        html = Markdown.new(markdown).to_html
        expect(html).to eql <<-HTML
<p>Here&#39;s some Ruby:</p>
<pre class="highlight ruby"><code><span class="no">Foo</span><span class="p">.</span><span class="nf">bar</span>
</code></pre>
        HTML
      end
    end
  end
end
