
namespace :jruby do

  task :init do
    FileUtils.rm_rf 'tmp'
    FileUtils.mkdir_p 'tmp'
  end

  desc 'extract jruby and all the current gems into the tmp folder'
  task :extract => :init do
    extract
  end

  desc 'repackage jruby and gems from tmp into the jruby-gems.jar file '
  task :repackage do 
    repackage
  end

  desc 'add a gem to the jruby-gems.jar file'
  task :add_gem, [:gem_name] => :extract do |task, args|
    gem_name = args[:gem_name].strip
    `java -jar jruby-gems.jar -S gem install -i tmp #{gem_name}`
    repackage
  end

  desc 'uninstall a gem from the jruby-gems.jar file'
  task :uninstall_gem, [:gem_name] => :extract do |task, args|
    gem_name = args[:gem_name].strip
    `java -jar jruby-gems.jar -S gem uninstall -i tmp #{gem_name}`
    repackage
  end

  def extract
    Dir.chdir('tmp') do
      `jar -xf ../jruby-gems.jar`
    end
  end

  def repackage
    FileUtils.rm_f 'jruby-gems.jar'
    `jar -cfm jruby-gems.jar jruby-gems.manifest -C tmp .`
  end
end
