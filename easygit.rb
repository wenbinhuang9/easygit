require "open3"
module EasyGit

    def self.branch_info
        command = 'git branch --merged master'
        info = command_to_a(command)
        info
        puts info
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



