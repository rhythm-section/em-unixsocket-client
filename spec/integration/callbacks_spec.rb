require 'helper'

describe "UnixSocketClient" do
  
  include EM::SpecHelper
  
  def start_server
    FakeUnixSocketServer.run(socket_path) do |server|
      yield server if block_given?
    end
  end
  
  def start_client
    EM::UnixSocketClient.run(socket_path()) do |ws|
      yield ws if block_given?
    end
  end
  
  it "should allow the client to be started inside an existing EM" do
    em do
      start_server do |server|
        server.onopen do
          server.send_data("Hello")
        end
      end
      
      start_client do |client|
        client.onmessage do |msg|
          msg.should eq('Hello')
          done
        end
      end
    end
  end
  
end