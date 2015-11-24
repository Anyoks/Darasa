if @order_url
      @status = "OK"
      @error = "none"
    else
      @status = "bad"
      @error = " can't load order_url"
end

json.status @status
json.error  @error

json.data do
	json.order_url @order_url 
end
