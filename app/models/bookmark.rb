class Bookmark < ApplicationRecord
  validates :member_id, uniqueness: { scope: :review_id }
end
