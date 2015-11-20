module Pesapal

	module Order
		# before_action :authenticate_user!
		   def self.generate_order_url #(data)
      # build xml with input data, the format is standard so no editing is
      # required
      # @post_xml = Pesapal::Helper::Post.generate_post_xml @order_details
      data = {
			amount: 1000,
			description: "payment for this exam #{@exam.title}",
			type: "MERCHANT",
			reference: Time.now.to_i.to_s,
			first_name: "#{current_user.first_name}",
			last_name: "#{current_user.first_name}",
			email: "#{current_user.email}",
			phonenumber: "#{current_user.phone_number}",
			currency: 'KES',
			answers_bought: []
		}

			line_items = ""

		data[:answers_bought].each do |line_item|
			line_items << %Q[<lineitem uniqueid="#{line_item[:user_id]}"
                              particulars="#{line_item[:exam_id]}"
                              quantity="#{line_item[:quantity] || '1'}"
                              unitcost="#{line_item[:unit_cost]}"
                              subtotal="#{line_item[:sub_total]}">
                            </lineitem>]
        end
      @xml = %[<?xml version="1.0" encoding="utf-8"?>
        <PesapalDirectOrderInfo
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"

                Amount="#{data[:amount]}"
                Currency="#{data[:currency] || 'USD'}"
                Description="#{data[:description]}"
                Type="#{data[:merchant] ||'MERCHANT'}"
                Reference="#{data[:reference]}"
                FirstName="#{data[:first_name]}"
                LastName="#{data[:last_name]}"
                Email="#{data[:email]}"
                PhoneNumber="#{data[:phone]}"
                xmlns="http://www.pesapal.com">
          <lineitems>
            #{line_items}
          </lineitems>
        </PesapalDirectOrderInfo>]

        

      # initialize setting of @params (oauth_signature left empty)
      @call_back_url = "localhost:3000/api/v1/processpayment/process"
       @consumer_key = "qdThc4z4QDjVI96cM7Oi5F1MF/WPMRbN"

      @params = set_parameters(@call_back_url, @consumer_key, @xml)

      # generate oauth signature and add signature to the request parameters
     # @params[:oauth_signature] = Pesapal::Oauth.generate_oauth_signature('GET', @api_endpoints[:postpesapaldirectorderv4], @params, @config[:consumer_secret], @token_secret)

      # change params (with signature) to a query string
      query_string = Pesapal::Oauth.generate_encoded_params_query_string @params

      "#{@api_endpoints[:postpesapaldirectorderv4]}?#{query_string}"
    end

    def self.set_parameters(callback_url, consumer_key, xml)
        timestamp = Time.now.to_i.to_s
        { oauth_callback: callback_url,
          oauth_consumer_key: consumer_key,
          oauth_nonce: "#{timestamp}" + Pesapal::Oauth.generate_nonce(12),
          oauth_signature_method: 'HMAC-SHA1',
          oauth_timestamp: "#{timestamp}",
          oauth_version: '1.0',
          pesapal_request_data: @xml
        }
      end
	end
end