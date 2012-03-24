namespace :jruby do

  task :init do
    FileUtils.rm_rf 'tmp'
    FileUtils.mkdir_p 'tmp'
  end

  desc 'extract jruby and all gems'
  task :extract => :init do
    extract
  end

  desc 'repackage all the jruby stuff and gems into the jar file'
  task :repackage do 
    repackage
  end

  desc 'add a gem to the packaged jar file for jruby'
  task :add_gem, [:gem_name] => :extract do |task, args|
    gem_name = args[:gem_name].strip
    `java -jar jruby-gems.jar -S gem install -i tmp #{gem_name}`
    repackage
  end

  desc 'uninstall a gem in the packaged jar file for jruby'
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
    sh 'jar -cfm jruby-gems.jar jruby-gems.manifest -C tmp .'
  end
end
