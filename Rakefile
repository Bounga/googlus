require 'bundler'
require 'rdoc/task'
Bundler::GemHelper.install_tasks

Rake::RDocTask.new(:rdoc_dev) do |rd|
 rd.main = "README"
 rd.rdoc_files.include("README", "lib/**/*.rb")
 rd.options << "--all"
end
