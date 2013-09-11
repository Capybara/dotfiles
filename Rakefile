task :default => 'update:updates'

namespace :update do
  desc "OS X system updates" 
  task :sys_update do
    sh "sudo softwareupdate -i -a"
  end

  desc "home brew update, upgrade, and cleanup" 
  task :brew_update do
    sh "brew update; brew upgrade; brew cleanup"
  end

	desc "rvm upgrade"
	task :rvm_upgrade do
		sh "rvm get stable"
	end

  desc "ruby gem update" 
  task :gem_update do
    sh "gem update"
  end

  desc "vim submodule updates" 
  task :vim_subs_update do
    sh "cd ~/dotfiles ; git submodule foreach git pull origin master; cd -"
  end

  desc "run all updates"   
  task :updates => [:brew_update, :gem_update, :vim_subs_update] do
    puts "ran all updates"
  end
end

namespace :utilities do
  desc "repair disk permissions" 
  task :repair do
    sh 'diskutil repairPermissions /'
  end
  desc "verify_disk" 
  task :verify_disk do
    sh 'diskutil verifyVolume /'
  end
end
