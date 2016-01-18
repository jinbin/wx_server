# -*- encoding : utf-8 -*-

require 'digest'

class Application < Grape::API

  Token = "wxtoken18658863627"
  TEST_Token = "testwxtoken18658863627"

  resource :wx do

    get '/' do 
      signature = params[:signature]
      timestamp = params[:timestamp]
      nonce = params[:nonce]
      echostr = params[:echostr]

      puts "signature: #{signature}\n" + "timestamp: #{timestamp}\n" + "nonce: #{nonce}\n" + "echostr: #{echostr}"

      account = Account.new Token
      account.check_wx_legality signature, timestamp, nonce, echostr
    end

    get "/test" do 
      signature = params[:signature]
      timestamp = params[:timestamp]
      nonce = params[:nonce]
      echostr = params[:echostr]

      puts "signature: #{signature}\n" + "timestamp: #{timestamp}\n" + "nonce: #{nonce}\n" + "echostr: #{echostr}"

      account = Account.new TEST_Token
      account.check_wx_legality signature, timestamp, nonce, echostr
    end

  end

  get "/test" do
    "ok"
  end

end
