task :default => 'update:updates'

def safe_task(&block)
	yield
rescue Exception => e
	e.message
	puts "there was a problem"
end

namespace :update do
  desc "OS X system updates" 
  task :sys_update do
		safe_task do
			sh "sudo softwareupdate -i -a"
		end
  end

  desc "home brew update, upgrade, and cleanup" 
  task :brew_update do
		safe_task do
			sh "brew update; brew upgrade; brew cleanup"
		end
  end

	desc "rvm upgrade"
	task :rvm_upgrade do
		safe_task do
			sh "rvm get stable"
		end
	end

  desc "ruby gem update" 
  task :gem_update do
		safe_task do
			sh "gem update"
		end
  end

  desc "vim submodule updates" 
  task :vim_subs_update do
		safe_task do
			sh "cd ~/dotfiles ; git submodule foreach git pull origin master; cd -"
		end
  end

  desc "run all updates"   
  task :updates => [:brew_update, :gem_update, :vim_subs_update] do
    puts "ran all updates"
  end
end

namespace :utilities do
  desc "repair disk permissions" 
  task :repair do
		safe_task do
			sh '/usr/sbin/diskutil repairPermissions /'
		end
  end
	desc "verify I.D.S monitored directories"
	task :ids do
		safe_task do
			sh 'sudo /ids_dir/ids.sh verify'
		end
	end
  desc "verify_disk" 
  task :verify_disk do
		safe_task do
			sh '/usr/sbin/diskutil verifyVolume /'
		end
  end
end
