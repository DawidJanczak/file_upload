class User < ApplicationRecord
  has_many_attached :attachments
end
