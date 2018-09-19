require 'rack'

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  
  if req.path == '/i/love/app/academy'
    res.write("/i/love/app/academy")
  end
  
  res['Content-Type'] = 'text/html'
  res.write("Hello World!")
  res.finish
end

Rack::Server.start(
  # app: Proc.new do |env|
  #   ['200', {'Content-Type' => 'text/html'}, ['hello world']]
  # end
  app: app,
  Port: 3000
)

