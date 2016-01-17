# -*- encoding : utf-8 -*-

require 'digest'

class Application < Grape::API

  Token = "wxtoken18658863627"

  resource :wx do

    get '/' do 
      signature = params[:signature]
      timestamp = params[:timestamp]
      nonce = params[:nonce]
      echostr = params[:echostr]

      # 将Token, timestamp, nonce进行字典序排序
      array = [Token, timestamp, nonce].sort
      # 将三个参数字符串拼接成一个字符串进行sha1加密, 与signature进行比较

      if signature == Digest::SHA1.hexdigest(array.join)
        return echostr
      else 
        "error/n"
      end
    end

  end

  get "/test" do
    "ok"
  end

end
