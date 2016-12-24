class Hasher

  ALPHABET = '123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ' # Base58
  SALT = Rails.application.secrets[:hashids_salt]
  MIN_HASH_LENGTH = 3

  def initialize
    @hashids = Hashids.new(SALT, MIN_HASH_LENGTH, ALPHABET)
  end

  def encode(param)
    @hashids.encode(param)
  end

  def decode(param)
    @hashids.decode(param).first
  end

end