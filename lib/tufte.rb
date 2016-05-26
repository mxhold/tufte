require "tufte/version"
require "tufte/binding"
require "tufte/post"
require "tufte/markdown"
require "tufte/cli"
require "tufte/helpers"
require "fileutils"
require "erb"

module Tufte
  def self.render(erb, instance_variables, helpers = Helpers)
    binding = Binding.new(instance_variables: instance_variables, mod: helpers)
    ERB.new(erb).result(binding)
  end

  def self.init
    scaffold_path = File.expand_path(File.join("..", "scaffold"), __dir__)
    FileUtils.cp_r(File.join(scaffold_path, "."), ".")
  end

  def self.build
    layout_template = File.read("templates/layout.html.erb")
    post_template = File.read("templates/post.html.erb")
    index_template = File.read("templates/index.html.erb")

    posts = Dir.glob("posts/*").map do |filename|
      Post.load(filename)
    end

    posts.each do |post|
      FileUtils.mkdir_p(post.output_directory)
      File.open(post.output_filename, "w") do |file|
        rendered_post = render(post_template, :@post => post)
        file.write(render(layout_template, :@content => rendered_post))
      end
      puts "Generated #{post.output_filename}"
    end

    File.open("index.html", "w") do |file|
      rendered_index = render(index_template, :@posts => posts)
      file.write(render(layout_template, :@content => rendered_index))
    end
    puts "Generated index.html"
  end
end
