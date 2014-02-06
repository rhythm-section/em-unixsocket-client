# EventMachine::UnixSocketClient

This is a EventMachine based async client for Unix domain sockets. This Gem is highly inspired by Ilya Grigorik's [em-websocket](https://github.com/igrigorik/em-websocket) library.

## Installation

Add this line to your application's Gemfile:

    gem 'em-unixsocket-client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install em-unixsocket-client

## Usage

### Simple Example

    require 'em-unixsocket-client'
    
    EM.run do
      EM::UnixSocketClient.run("/tmp/my.socket") do |us|
      
      us.onclose { puts "Connection closed" }
      
      us.onmessage do |msg|
        puts "Recieved message: #{msg}"
        us.send "Pong: #{msg}"
      end
    end

## License

The MIT License - Copyright (c) 2014 Christoph Edthofer, Thomas Esterer