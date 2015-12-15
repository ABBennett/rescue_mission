class Question < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 40}
  validates :description, presence: true, length: {minimum: 150}
end
