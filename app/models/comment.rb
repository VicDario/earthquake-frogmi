class Comment < ApplicationRecord
  belongs_to :feature

  validates :body, presence: true, length: { minimum: 1 }

  def serialize
    {
      body: body,
      created_at: created_at,
    }
  end
end
