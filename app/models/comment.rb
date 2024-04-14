class Comment < ApplicationRecord
  belongs_to :earthquake

  validates :body, presence: true, length: { minimum: 1 }
end
