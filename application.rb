# -*- encoding : utf-8 -*-

require 'digest'

class Application < Grape::API

  Token = "wxtoken18658863627"

  get '/' do 
    signature = params[:signature]
    timestamp = params[:timestamp]
    nonce = params[:nonce]
    echostr = params[:echostr]

    puts "signature: #{signature}"
    puts "timestamp: #{timestamp}"
    puts "nonce: #{nonce}"
    puts "echostr: #{echostr}"

    if signature.nil? || timestamp.nil? || nonce.nil? || echostr.nil?
      return "<p>error</p>"
    end

    # 将Token, timestamp, nonce进行字典序排序
    array = [Token, timestamp, nonce].sort
    # 将三个参数字符串拼接成一个字符串进行sha1加密, 与signature进行比较

    if signature == Digest::SHA1.hexdigest(array.join)
      return echostr
    else 
      return "<p>error</p>"
    end
  end

  get "/test" do
    "ok"
  end

end
