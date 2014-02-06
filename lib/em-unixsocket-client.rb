require "eventmachine"

%w[
  debugger
  unixsocket
  connection
].each do |file|
  require "em-unixsocket-client/#{file}"
end