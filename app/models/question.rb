class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, length: {minimum: 40}
  validates :description, presence: true, length: {minimum: 150}
end
