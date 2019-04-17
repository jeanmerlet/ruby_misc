require 'socket'
require 'json'

@host = 'localhost'
@port = 3000

def parse_response(response)
  top, @body = response.split(/\r\n\r\n/, 2)
  top_parts = top.split(/\r\n/)
  status_line = top_parts[0]
  @status = status_line.split(" ")[1]
  headers = top_parts[1..-1]
end

def connect(request)
  socket = TCPSocket.open(@host, @port)
  socket.print(request)
  response = socket.read
  parse_response(response)
  puts @body
end

loop do
  printf "type GET or POST to specify your request type: "
  input = gets.chomp
  case input
    when "GET"
      connect("GET /index.html HTTP/1.0\r\n\r\n")
    when "POST"
      puts "registering your viking for a raid, as requested.."
      printf "enter viking's name: "
      name = gets.chomp
      printf "enter viking's e-mail: "
      email = gets.chomp

      request_line = "POST /thanks.html HTTP/1.0"
      form_data = {viking: {name: name, email: email}}.to_json
      content_length = "Content-Length: #{form_data.length}"
      request = [request_line, content_length, "", form_data].join("\r\n")
      connect(request)
    else
      puts "GET or POST are your only options, so you should probably type one of those"
  end
end
