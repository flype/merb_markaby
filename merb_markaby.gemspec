Gem::Specification.new do |s|
  s.name     = "merb_markaby"
  s.version  = "1.0.0"
  s.date     = "2008-12-13"
  s.summary  = "merb_markaby"
  s.email    = "felipe.talavera@gmail.com"
  s.homepage = "http://github.com/flype/merb_markaby.git"
  s.description = "it repository in and object oriented manner."
  s.has_rdoc = true
  s.authors  = ["Felipe Talavera"]
  s.files    = ["LICENSE", "Rakefile", "README", "lib/merb_markaby.rb", "lib/merb_markaby/merbtasks.rb", "lib/merb_markaby/template.rb"]
  s.test_files = []
  s.rdoc_options = ["--main", "README.txt"]
  s.extra_rdoc_files = []
  s.add_dependency("diff-lcs", ["> 0.0.0"])
  s.add_dependency("mime-types", ["> 0.0.0"])
  s.add_dependency("open4", ["> 0.0.0"])
end
