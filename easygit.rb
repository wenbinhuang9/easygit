require "open3"
module EasyGit

    def self.branchs(command)
        info = command_to_a(command).map {|e| e.strip.gsub(/^[+*]\s+/, "")}
        info 
    end 

    def self.git_checkout_by_branch_number(number)
        infos = local_branchs_info
       
        branch_name = infos[number][1]
        puts branch_name

        command_to_a('git checkout ' + branch_name)
    end 

    def self.local_branchs_info
        command = 'git branch'
        infos = branchs_info(branchs(command))

        infos

    end 
    def self.merged_branchs_info
        command = 'git branch --merged master'
        infos = branchs_info(branchs(command))

        views infos
        infos         
    end 

    def views(infos)
        infos.map {|line|  puts line.join(' ')}
    end 

    def self.branchs_info(branchs)
        branchs_info = branchs.map.with_index do |b, i|
            arr = [i, b]
            info = arr + branch_info(b) + ["merged"]

            info 
        end 
        branchs_info
    end

    def self.git_checkout_by_number(number)

    end 
    # todo giving a branch name here 
    def self.branch_info(branch_name) 
        command = %Q(git log -n1 --date=short --format=format:"%cd %n %h %n %an %n %s" #{branch_name})

        info = command_to_a(command)

        info
    end


    def self.command_to_a(command) 
        command_output(command).split($/).map(&:strip)
    end 
    #Runs the passed string as a system command and returns its output.
    # If the command doesn't exit with 0 (success), then an error will be thrown, with the error
    # output as its message.
    def self.command_output(command)
      stdout_str, stderr_str, status = Open3.capture3(command)

      stdout_str
    end
end