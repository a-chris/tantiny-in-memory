# frozen_string_literal: true

require_relative "lib/tantiny/version"

Gem::Specification.new do |spec|
  spec.name = "tantiny-in-memory"
  spec.version = Tantiny::VERSION
  spec.authors = ["Christian Toscano"]
  spec.email = ["a.christian.toscano@gmail.com"]
  spec.homepage = "https://github.com/a-chris/tantiny-in-memory"
  spec.summary = "Tiny full-text search for Ruby powered by Tantivy but in memory!"

  spec.license = "MIT"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/a-chris/tantiny-in-memory/issues",
    "changelog_uri" => "https://github.com/a-chris/tantiny-in-memory/blob/master/CHANGELOG.md",
    "documentation_uri" => "https://github.com/a-chris/tantiny-in-memory/blob/master/README.md",
    "homepage_uri" => "https://github.com/a-chris/tantiny-in-memory",
    "source_code_uri" => "https://github.com/a-chris/tantiny-in-memory"
  }

  spec.required_ruby_version = ">= 2.7"

  spec.files = [
    Dir.glob("bin/**/*"),
    Dir.glob("ext/**/*"),
    Dir.glob("lib/**/*"),
    Dir.glob("lib/.rbnext/**/*"),
    Dir.glob("sig/**/*"),
    Dir.glob("src/**/*"),
    "Cargo.toml",
    "README.md",
    "CHANGELOG.md",
    "LICENSE"
  ].flatten

  spec.extensions << "ext/Rakefile"

  spec.require_paths = ["lib"]

  if ENV["RELEASING_GEM"].nil? && File.directory?(File.join(__dir__, ".git"))
    spec.add_runtime_dependency "ruby-next", "~> 0.14.0"
  else
    spec.add_runtime_dependency "ruby-next-core", "~> 0.14.0"
  end

  spec.add_runtime_dependency "rutie", "~> 0.0.4"
  spec.add_runtime_dependency "thermite", "~> 0"
  spec.add_runtime_dependency "rake", "~> 13.0"
  spec.add_runtime_dependency "concurrent-ruby", "~> 1.0"
end
