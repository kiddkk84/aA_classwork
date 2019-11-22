class Comment < ApplicationRecord
 belongs_to :author,
    foreign_key: :user_id,
    class_name: :User,
    dependent: :destroy


  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :ArtWork, 
    dependent: :destroy


end
