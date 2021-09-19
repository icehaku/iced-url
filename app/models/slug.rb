class Slug < ApplicationRecord
  has_secure_token :short_url, length: 5

  has_many :clicks

  validate :valid_url?

  # valid_url?
  # This is one way to do it, between others approaches we could take here.
  # We could use a custom regex, but domains and web sites nowadays are less obvious than the clasic http://www.domain.com.
  # We could even consider others status besides 200 as valid because, since there is a lot of other success codes.
  # Maybe we don't even want to try a real request, since this will use way more time/resource than a logic check.
  # So I'll keep it simple, but I know that depending on what we wanted, it could be different.

  def valid_url?
    # Not sure if we should make a change in the user initial data, we could just return as invalid.
    my_target_url = target_url.match(/http/) ? target_url : target_url.prepend("http://")

    response = HTTParty.get(my_target_url) rescue nil

    return if response&.code == 200

    errors.add(:short_url)
  end
end
