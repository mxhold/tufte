require "spec_helper"
require "date"

module Tufte
  RSpec.describe Post do
    subject do
      Post.new(
        date: Date.parse("2016-05-16"),
        title: "The Title",
        raw_body: "This is the body. <%= @post.slug %> <%= marginnote('mynote', 'hello') %>",
        slug: "my-post",
      )
    end

    describe "#date" do
      it "returns the date formatted as year, month, day" do
        expect(subject.date).to eql "2016 May 16"
      end
    end

    describe "#title" do
      it "returns the title" do
        expect(subject.title).to eql "The Title"
      end
    end

    describe "#body" do
      it "renders ERB with helpers, @post, and then to HTML" do
        expect(subject.body).to eql "<p>This is the body. my-post <label for=\"mynote\" class=\"margin-toggle\">&#8853;</label>\n<input type=\"checkbox\" id=\"mynote\" class=\"margin-toggle\"/>\n<span class=\"marginnote\">\nhello\n</span></p>\n"
      end
    end

    describe "#output_directory" do
      it "returns a directory based on the post's date and slug" do
        expect(subject.output_directory).to eql "2016/5/16/my-post"
      end
    end

    describe "#output_filename" do
      it "returns an index file inside the output directory" do
        expect(subject.output_filename).to eql "2016/5/16/my-post/index.html"
      end
    end

    describe ".load" do
      it "returns a new post based on the provided YAML file" do
        file_contents = <<-YAML
---
title: My Post Title
date: 2016-05-15
---
This is a post.
        YAML
        expect(File).to receive(:read).with("my-post.yml") { file_contents }
        post = Post.load("my-post.yml")
        expect(post.slug).to eql "my-post"
        expect(post.date).to eql "2016 May 15"
        expect(post.title).to eql "My Post Title"
        expect(post.body).to eql "<p>This is a post.</p>\n"
      end
    end
  end
end
