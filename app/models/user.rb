class User < ApplicationRecord
  has_secure_password
<<<<<<< HEAD

  has_many :posts, -> { ordering }, dependent: :destroy
  has_many :comments, -> { ordering }, dependent: :destroy

  scope :ordering, -> { order(:name) }


  validates :name, presence: true, length: {in: 2...100}
  validates :login, presence: true, length: {in: 2..100}, uniqueness: {case_sensetive: false}

  def edit_by?(current_user)
    current_user && (current_user == self || current_user.admin?)
  end
=======
  has_many :articles

  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, presence: true, uniqueness: true
  validates :name, presence: true, length: {minimum: 2, maximum: 128  }

>>>>>>> 525814296584dd49da78dc598afcf50ee392fa23
end
