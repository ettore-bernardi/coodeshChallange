class Article < ApplicationRecord
  has_many :launches, dependent: :destroy
  accepts_nested_attributes_for :launches, allow_destroy: true

  has_many :events, dependent: :destroy
  accepts_nested_attributes_for :events, allow_destroy: true
end
