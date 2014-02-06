module EventMachine
  module UnixSocketClient
    class Connection < EventMachine::Connection
      
      # TODO onerror, etc.
      
      def onmessage(&blk)
        @onmessage = blk
      end
  
      def trigger_on_message(msg)
        @onmessage.call(msg) if defined? @onmessage
      end
  
      def receive_data(data)
        puts "[UNIX] #{data}"
        trigger_on_message(data)
      end

      def unbind
        puts "[UNIX] client disconnected."
      end
    end
  end
end