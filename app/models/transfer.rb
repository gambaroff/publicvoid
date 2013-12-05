class Transfer < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 80 }
  validates :user_id, presence: true
  has_attached_file :transfered_file, styles: { original: "4000x4000>", large: "1500x1500>", medium: "300x300>", small: "200x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
end
