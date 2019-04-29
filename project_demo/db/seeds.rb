# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all


names = ['Darian', 'Eric', 'Jeff', 'Jian', 'Matt']
emails = ['dar@fake.com', 'erc@fake,com', 'jeff@fake.com', 'jian@fake.com', 'matt@fake.com']

names.each_with_index do |name,idx|

    User.create!(username: name, email: emails[idx])

end




# Table name: artworks
#
#  id        :bigint           not null, primary key
#  title     :string           not null
#  img_url   :string           not null
#  artist_id :integer          not null

title = ['Da Best Art', 'WTF?', 'Ironman', 'Spiderman', 'Hulk']
img_url = ['joshua.com', 'sadface.com', 'yay.com', 'something.com', 'mattyt.com']

Artwork.create(title: title[0], img_url: img_url[0], artist_id: User.first.id)
Artwork.create(title: title[1], img_url: img_url[1], artist_id: User.first.id)
Artwork.create(title: title[2], img_url: img_url[2], artist_id: User.second.id)
Artwork.create(title: title[3], img_url: img_url[3], artist_id: User.third.id)
Artwork.create(title: title[4], img_url: img_url[4], artist_id: User.fourth.id) 

#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null

ArtworkShare.create(viewer_id: User.first.id, artwork_id: Artwork.last.id)
ArtworkShare.create(viewer_id: User.first.id, artwork_id: Artwork.second.id)
ArtworkShare.create(viewer_id: User.third.id, artwork_id: Artwork.second.id)
ArtworkShare.create(viewer_id: User.fourth.id, artwork_id: Artwork.third.id)