# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.authors = "Roberto Vasquez Angel"
  s.name = "ECM CMS Navigation"
  s.summary = "Provides database backend for simple navigation"
  s.description = "Provides database backend for simple navigation"
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.1"
  s.add_dependency("awesome_nested_set")
  s.add_dependency("simple-navigation")
end
