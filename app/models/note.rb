class Note < ActiveRecord::Base
  has_and_belongs_to_many :labels

  scope :not_expired, -> { where(expire_date: nil)}
end
