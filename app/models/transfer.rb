class Transfer < ActiveRecord::Base
  belongs_to :user
  has_attached_file :transferred_file, default_url: "/images/:style/missing.png"
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
end
