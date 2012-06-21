class DiskTool 
    #1 KB = 1024 B 
    #1 MB = 1048576 B = 1024 KB 
    #1 GB = 1073741824 B = 1048576 KB = 1024 MB

    def report(path)
        size = disk_size(path)
        free_space = disk_free_space(path)
        used_space = disk_used_space(path)
        {:name => path, :free => free_space, :used => used_space, :usage => usage(size, used_space)}
    end

    private 
        def disk_size(path)
            `df -Pk #{path} |grep ^/ | awk '{print $2;}'`.to_i * 1024
        end
    
        def disk_used_space( path )
          `df -Pk #{path} |grep ^/ | awk '{print $3;}'`.to_i * 1024
        end

        def disk_free_space( path )
          `df -Pk #{path} |grep ^/ | awk '{print $4;}'`.to_i * 1024
        end
        
        def usage(size, used)
            ((used.to_f/size.to_f)*100.0).round
        end
end

#/-----------------------------------------------\


def format(amount)
    megabyte = (1024*1024)
    gigabyte = (megabyte*1024) 

    if amount >= gigabyte 
        amount = amount / gigabyte
        return "#{amount}GB"
    else
        amount = amount / megabyte
        return "#{amount}MB"
    end
end

dt = DiskTool.new

op_sys = dt.report("/")
home = dt.report("/home")

report = ""
[op_sys, home].each do |item|
    report << "[#{item[:name]}] free: #{format(item[:free])} used: #{format(item[:used])} usage: #{item[:usage]}"<< "\n"
end


puts report





