require "spec_helper"
require "tmpdir"

RSpec.describe "integration test" do
  describe "build" do
    it "creates the index file and blog posts" do
      Dir.mktmpdir do |tmpdir|
        Dir.chdir(tmpdir) do
          Dir.mkdir("templates")
          Dir.mkdir("posts")
          File.open("templates/layout.html.erb", "w") do |file|
            file.write <<-ERB
<html>
<head>
<title>My blog</title>
</head>

<body>
<%= @content %>
</body>

</html>
            ERB
          end

          File.open("templates/index.html.erb", "w") do |file|
            file.write <<-ERB
<h1>Welcome to my blog</h1>

<ul>
<% @posts.each do |post| %>
  <li>
    <a href="<%= post.output_directory %>"><%= post.title %></a>
  </li>
<% end %>
</ul>
            ERB
          end

          File.open("templates/post.html.erb", "w") do |file|
            file.write <<-ERB
<h1><%= @post.title %></h1>
<h2><%= @post.date %></h1>

<%= @post.body %>
            ERB
          end

          File.open("posts/hello-world.yml", "w") do |file|
            file.write <<-ERB
---
title: Hello World
date: 2016-05-12
---
Hello, world!

```ruby
Date.today
  ```
            ERB
          end

          expect do
            Tufte.build
          end.to output(<<-EOF).to_stdout
Generated 2016/5/12/hello-world/index.html
Generated index.html
          EOF

          expect(File.read("2016/5/12/hello-world/index.html")).to eql <<-HTML
<html>
<head>
<title>My blog</title>
</head>

<body>
<h1>Hello World</h1>
<h2>2016 May 12</h1>

<p>Hello, world!</p>
<pre class="highlight ruby"><code><span class="no">Date</span><span class="p">.</span><span class="nf">today</span>
</code></pre>


</body>

</html>
          HTML
          expect(File.read("index.html")).to eql <<-HTML
<html>
<head>
<title>My blog</title>
</head>

<body>
<h1>Welcome to my blog</h1>

<ul>

  <li>
    <a href="2016/5/12/hello-world">Hello World</a>
  </li>

</ul>

</body>

</html>
          HTML
        end
      end
    end
  end

  describe "init" do
    it "generates scaffold files" do
      Dir.chdir("scaffold")
      scaffold_files = Dir.glob(File.join("**", "*"))
      Dir.mktmpdir do |tmpdir|
        Dir.chdir(tmpdir) do
          Tufte.init

          scaffold_files.each do |filename|
            expect(File.exist?(filename)).to eql true
          end
        end
      end
    end
  end
end
