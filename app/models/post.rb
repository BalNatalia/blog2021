class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, -> { ordering }, dependent: :destroy

  scope :ordering, -> { order(created_at: :desc) }

  validates :title, presence: true, length: {in: 2..255}
  validates :body, presence: true
  validate :check_user

  def edit_by?(current_user)
    current_user == user || current_user&.admin?
  end

  private
  def check_user
    if  new_record? && Post.where('user_id = ? and created_at > ?', user_id, 1.day.ago).count >= 5
            errors.add(:base, 'Превышен лимит на максимальное количество сообщений за сутки')
  end
  
end
end
