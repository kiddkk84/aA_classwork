# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ArtworkShare.destroy_all
User.destroy_all
ArtWork.destroy_all


user1 = User.create({username: 'user_1', email: 'user1@user_1.com'})
user2 = User.create({username: 'user_2', email: 'user1@user_2.com'})
user3 = User.create({username: 'user_3', email: 'user1@user_3.com'})



art1 = ArtWork.create({title: 'art_1', image_url: 'http://art_1.com', artist_id:user1.id})
art2 = ArtWork.create({title: 'art_2', image_url: 'http://art_2.com', artist_id:user2.id})
art3 = ArtWork.create({title: 'art_3', image_url: 'http://art_3.com', artist_id:user3.id})

share1 = ArtworkShare.create({viewer_id:user1.id, artwork_id:art2.id})
share2 = ArtworkShare.create({viewer_id:user3.id, artwork_id:art2.id})
share3 = ArtworkShare.create({viewer_id:user2.id, artwork_id:art1.id})


comment1 = Comment.create({user_id:user1.id, artwork_id:art2.id, body: 'first comment~~'})