class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6, message: 'cannot be shorter than 6 characters' }

  validates :movie_id, uniqueness: {
    scope: :list_id,
    message: 'is already in this list'
  }
end
