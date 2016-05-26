require "spec_helper"
require "tmpdir"

def all_files_in_current_directory
  Dir.glob("./**/*").reject do |filename|
    File.directory?(filename)
  end.map do |filename|
    [filename, File.read(filename)]
  end.to_h
end

RSpec.describe "integration test" do
  describe "running init and build from scratch" do
    it "generates exactly the expected files" do
      expected_scaffold_files = Dir.chdir("scaffold") do
        all_files_in_current_directory
      end

      expected_built_files = Dir.chdir("spec/assets/integration") do
        all_files_in_current_directory
      end

      Dir.mktmpdir do |tmpdir|
        Dir.chdir(tmpdir) do
          Tufte.init

          expect do
            Tufte.build
          end.to output(<<-TXT).to_stdout
Generated 2016/5/15/syntax-highlight-test/index.html
Generated index.html
          TXT

          actual_files = all_files_in_current_directory

          actual_files.each do |filename, contents|
            if expected_scaffold_files[filename]
              expect(contents).to eql expected_scaffold_files[filename]
            elsif expected_built_files[filename]
              expect(contents).to eql expected_built_files[filename]
            else
              raise "Unexpected file #{filename}"
            end
          end

          expect(actual_files.keys).to match_array(
            expected_scaffold_files.keys + expected_built_files.keys
          )
        end
      end
    end
  end
end
