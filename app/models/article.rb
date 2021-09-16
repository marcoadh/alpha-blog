class Article < ApplicationRecord
    belongs_to :user

    validates :title, length: {minimum: 3, maximum: 50}
    validates :description, length: {minimum: 5, maximum: 300}

    validates :user_id, presence: true
end
