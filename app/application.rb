class Application
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
      
        if req.path.match(/items/)
            item = req.path.split("/")[2]
            this_item = Item.all.find {|each_item| each_item.name == item }
            if this_item == nil
                resp.write "Item not found"
                resp.status = 400
            else
                resp.write "#{this_item.price}"
            end
                

        else 
           resp.write "Route not found" 
           resp.status = 404 
        end

        resp.finish
    end
end