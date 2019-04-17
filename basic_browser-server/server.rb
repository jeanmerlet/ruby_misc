require 'socket'
require 'json'

def parse_request(request)
  lines = request.split("\r\n")

  request_line_parts = lines[0].split(" ")
  @request_type = request_line_parts[0]
  request_path = request_line_parts[1]
  @filepath = request_path[1..-1]

  headers = lines[1..-1]
  @content_length = headers.map { |header| header[/\d+/] if header.include?("Content-Length") }
end

def parse_request_body(message)
  @params = JSON.parse(message)
end

def generate_response
  if File.exist?(@filepath)
    status_code = "200 OK"
    if @request_type == "GET"
      body = File.readlines(@filepath).join("")
    elsif @request_type == "POST"
      form_data = @params["viking"].map { |k, v| "<li>#{k}: #{v}</li>" }
      body = File.readlines('thanks.html').join("")
      body.sub!("<%= yield %>", form_data.join(""))
    end
  else
    status_code = "404 Not Found"
    body = nil
  end

  status_line = "HTTP/1.0 #{status_code}"
  content_length = "Content-Length: #{body.length}"
  @response = [status_line, content_length, ""]
  @response << body if body
end

server = TCPServer.open(3000)

loop do
  client = server.accept

  request = ""
  while line = client.gets
    request << line
    break if line == "\r\n"
  end
  parse_request(request)

  if @content_length[0] != nil
    message = client.read(@content_length[0].to_i)
    parse_request_body(message)
  end

  generate_response
  @response.each { |line| client.print("#{line}\r\n") }

  client.close
end
