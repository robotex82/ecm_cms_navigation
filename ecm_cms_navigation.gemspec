$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ecm/cms_navigation/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ecm_cms_navigation"
  s.version     = Ecm::CmsNavigation::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "http://blog.robotex.de"
  s.summary     = "Provides database backend for simple navigation."
  s.description = "Provides database backend for simple navigation."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.3"
  s.add_dependency "awesome_nested_set"
  s.add_dependency "simple-navigation"

  s.add_development_dependency "sqlite3"
end
