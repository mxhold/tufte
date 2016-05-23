require "spec_helper"

RSpec.describe Tufte::CLI do
  describe ".run" do
    describe "init" do
      it "generates scaffold files in the current directory" do
        expect(Tufte).to receive(:init)
        Tufte::CLI.run("init")
      end
    end

    describe "build" do
      it "generates HTML files based on the templates" do
        expect(Tufte).to receive(:build)
        Tufte::CLI.run("build")
      end
    end

    describe "serve" do
      it "starts a development server" do
        stub_const("Rack::Server", double)
        expect(Rack::Server).to receive(:start)
        Tufte::CLI.run("serve")
      end
    end

    describe "help" do
      ["help", "-h", "--help"].each do |command|
        it "prints the usage given #{command}" do
          expect do
            Tufte::CLI.run(command)
          end.to output(<<-USAGE).to_stdout
Usage: tufte [command]
Commands:
  init             Scaffold a new blog in the current directory
  build            Generate HTML pages based on the templates
  serve            Start a development server to host your files locally
  version          Print the current version
  help             Print this message
          USAGE
        end
      end
    end

    describe "version" do
      ["version", "-v", "--version"].each do |command|
        it "prints the version given #{command}" do
          expect do
            Tufte::CLI.run(command)
          end.to output("#{Tufte::VERSION}\n").to_stdout
        end
      end
    end
  end
end
