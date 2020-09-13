class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
#
        if req.path.match(/items/)
            name_of_item = req.path.split("/items/").last
            get_item = @@items.find{|item| item.name == name_of_item}
            if get_item == nil
                resp.status = 400
                resp.write "Item not found"
            else 
                resp.write "The price of #{name_of_item} is #{get_item.price}"
            end
        else 
            resp.write "Route not found"
            resp.status = 404
        end
#
        resp.finish
    end

end