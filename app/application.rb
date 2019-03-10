require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    path_string = req.path.split('/')
    if path_string[1]=="items"
      if Item.all.find{|i| i.name == path_string[-1]} == nil
        resp.write "Item not found"
        resp.status = 400
      elsif Item.all.map{|i| i.name}.include?(Item.all.find{|i| i.name == path_string[-1]}.name)
        resp.write Item.all.find{|i| i.name == path_string[-1]}.price
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
