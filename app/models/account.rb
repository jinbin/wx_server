class Account

  def initialize token
    @token = token
  end

  def check_wx_legality signature, timestamp, nonce, echostr
    if signature.nil? || timestamp.nil? || nonce.nil? || echostr.nil?
      return "error"
    end

    # 将Token, timestamp, nonce进行字典序排序
    array = [@token, timestamp, nonce].sort

    # 将三个参数字符串拼接成一个字符串进行sha1加密, 与signature进行比较
    if signature == Digest::SHA1.hexdigest(array.join)
      return echostr
    else
      return "error"
    end

  end
end
