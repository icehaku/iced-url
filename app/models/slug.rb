class Slug < ApplicationRecord
	has_secure_token :short_url, length: 5
end