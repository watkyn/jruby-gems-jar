
JRUBY_GEMS_JAR = 'jruby-gems.jar'
 
namespace :jruby do

  task :init do
    FileUtils.rm_rf 'tmp'
    FileUtils.mkdir_p 'tmp'
  end

  desc 'extract jruby and all the current gems into the tmp folder'
  task :extract => :init do
    extract
  end

  desc "repackage jruby and gems from tmp into the #{JRUBY_GEMS_JAR} file"
  task :repackage do 
    repackage
  end

  desc "add a gem to the #{JRUBY_GEMS_JAR} file"
  task :add_gem, [:gem_name] => :extract do |task, args|
    gem_name = args[:gem_name].strip
    `java -jar #{JRUBY_GEMS_JAR} -S gem install -i tmp #{gem_name}`
    repackage
  end

  desc "uninstall a gem from the #{JRUBY_GEMS_JAR} file"
  task :uninstall_gem, [:gem_name] => :extract do |task, args|
    gem_name = args[:gem_name].strip
    `java -jar #{JRUBY_GEMS_JAR} -S gem uninstall -i tmp #{gem_name}`
    repackage
  end

  def extract
    FileUtils.rm_rf 'tmp'
    FileUtils.mkdir 'tmp'
    Dir.chdir('tmp') do
      `jar -xf ../#{JRUBY_GEMS_JAR}`
    end
  end

  def repackage
    FileUtils.rm_rf JRUBY_GEMS_JAR
    FileUtils.mv(Dir.glob('tmp/bin/*'), 'tmp/META-INF/jruby.home/bin')
    `jar -cfm #{JRUBY_GEMS_JAR} jruby-gems.manifest -C tmp .`
  end
end
