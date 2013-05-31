$reloads = {}

def reload(file)
  $reloads[file] = File.mtime(file)
  load(file)
end

def reload!
  $reloads.dup.each do |file,time|
    mtime = File.mtime(file)
    if File.mtime(file) > time
      puts "Reloading #{file}"
      load(file)
      $reloads[file] = mtime
    end
  end
end

reload("game.rb")

WIDTH = 640
HEIGHT = 480

Game.new.show


