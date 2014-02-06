require 'rubygems'
require 'rspec'
require 'em-spec/rspec'

require 'em-unixsocket-client'

# a helper method to generate a path for a socket file
def socket_path
  File.join(File.expand_path('../../', __FILE__), 'tmp/test.sock')
end

# This is a EM::Connection subclass for our fake socket server
class FakeUnixSocketServerConnection < EM::Connection
  
  # run this callback only once after a connection to
  # a client has been opened
  def onopen(&blk)
    @onopen = blk
    
    if @state==:new
      @onopen.call()
      @state=:open
    end
  end
  
  def onclose(&blk);    @onclose = blk;   end
  def onerror(&blk);    @onerror = blk;   end
  def onmessage(&blk);  @onmessage = blk; end
  
  # set the state to :new so we know if the onopen callback
  # needs the be called
  def initialize
    @state = :new
  end
  
  def receive_data(data)
    @onmessage.call(data) if defined? @onmessage
  end
  
  def unbind
    @onclose.call if defined? @onclose
  end
  
end

# This is the module for our fake socket server
module FakeUnixSocketServer
  
  def self.run(socket_path, options={})
    EM.start_unix_domain_server(socket_path, FakeUnixSocketServerConnection) do |c|
      yield c
    end
  end
  
end
