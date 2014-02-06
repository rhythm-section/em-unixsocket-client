module EventMachine
  module UnixSocketClient
    
    def self.start(socket_path, options={}, &blk)
      EM.epoll
      EM.run {
        trap("TERM") { stop }
        trap("INT")  { stop }

        run(socket_path, options, &blk)
      }
    end
    
    def self.run(socket_path, options={})
      EM.connect_unix_domain(socket_path, Connection) do |c|
        yield c
      end
    end
    
    def self.stop
      puts "Terminating UnixSocket"
      EM.stop
    end
    
  end
end