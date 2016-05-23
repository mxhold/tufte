require "tufte/version"
require "tufte/instance_variable_binding"
require "tufte/post"
require "tufte/markdown"
require "fileutils"

module Tufte
  def self.render(erb, instance_variables)
    binding = InstanceVariableBinding.new(instance_variables)
    ERB.new(erb).result(binding)
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
    end

    File.open("index.html", "w") do |file|
      file.write(render(index_template, :@posts => posts))
    end
  end
end
