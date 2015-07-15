plaintext = "things"
key = "one rather long passphrase"

def otpencrypt(plain, key)
  encrypted = ''
  plain.chars.each_with_index do |c, i|
    encrypted += (c.ord ^ key[i].ord).chr
  end
  encrypted
end

def otpdecrypt(encrypted, key)
  decrypted = ''
  encrypted.chars.each_with_index do |c, i|
    decrypted += (c.ord ^ key[i].ord).chr
  end
  decrypted
end

otpencrypted = otpencrypt plaintext, key
otpdecrypted = otpdecrypt otpencrypted, key

puts "#{otpencrypted.inspect} #{otpdecrypted}"

def rpcrypt(plain, key)
  encrypted = ''
  local_key = key.chars
  plain.chars.each_with_index do |c, i|
    encrypted += (c.ord ^ local_key.rotate.first.ord).chr
  end
  encrypted
end

def rpdecryupt(encrypted, key)
  decrypted = ''
  local_key = key.chars
  encrypted.chars.each_with_index do |c, i|
    decrypted += (c.ord ^ local_key.rotate.first.ord).chr
  end
  decrypted
end

plaintext = "A plaintext that is relatively longer than the passphrase"

rpencrypted = rpcrypt plaintext, key
rpdecrypted = rpdecryupt rpencrypted, key

puts "#{rpencrypted.inspect} #{rpdecrypted}"
