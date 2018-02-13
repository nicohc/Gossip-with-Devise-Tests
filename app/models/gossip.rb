class Gossip < ApplicationRecord
  belongs_to :user , foreign_key: "user_id"

  validates :content, presence: true,
                     length: { minimum: 5 }

end
