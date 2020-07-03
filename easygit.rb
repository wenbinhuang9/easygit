require "open3"
module EasyGit

    # todo give full branch info
    def self.merged_branchs
        command = 'git branch --merged master'
        info = command_to_a(command)
        info
    end
    def self.merged_branchs_info
    end
    # todo giving a branch name here 
    def self.branch_info(branch_name) 
        command =  command = %Q(git log -n1 --date=short --format=format:"%cd %n %h %n %an %n %s" #{branch_name})

        info = command_to_a(command)
        info
        puts info
    end

    # input is  list branch detail info 
    def self.format 

    end

    def self.command_to_a(command) command_output(command).split($/).map(&:strip) end 
    #Runs the passed string as a system command and returns its output.
    # If the command doesn't exit with 0 (success), then an error will be thrown, with the error
    # output as its message.
    def self.command_output(command)
      stdout_str, stderr_str, status = Open3.capture3(command)

      stdout_str
    end


end



