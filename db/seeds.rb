# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'byebug'

User.destroy_all
Owner.destroy_all
Walker.destroy_all
Invoice.destroy_all
Dog.destroy_all
Appointment.destroy_all
Service.destroy_all




10.times do
  User.create!(name: Faker::Name.unique.name, username: Faker::Internet.unique.username(5), password: Faker::Internet.password(8), email: Faker::Internet.email, role: "owner")
end

12.times do
  User.create!(name: Faker::Name.unique.name, username: Faker::Internet.unique.username(5), password: Faker::Internet.password(8), email: Faker::Internet.email, role: "walker" )
end

@user_ids = User.pluck(:id)



house_pic = [
  "https://images.pexels.com/photos/1884269/pexels-photo-1884269.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/1029599/pexels-photo-1029599.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/2063258/pexels-photo-2063258.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/1884264/pexels-photo-1884264.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/209315/pexels-photo-209315.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/376547/pexels-photo-376547.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/1834739/pexels-photo-1834739.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/2067570/pexels-photo-2067570.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/161768/lafayette-park-washington-dc-c-architecture-161768.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/1396132/pexels-photo-1396132.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
]

# We have to iterate through to add user_ids to each owner & walker
10.times do |i|
  Owner.create!(address: Faker::Address.street_address, city: Faker::Address.city, user_id: @user_ids[i],
  image: house_pic[i])
end

@owner_ids = Owner.pluck(:id)


@friendly = ["aggressive", "untrained", "playful" , "passive", "friendly", "trained"]
@restrictions = ["medication", "dogfood", "diet", "notsocial"]

dog_pics = ["https://i.pinimg.com/originals/22/81/89/2281893b67d3f704aacd772f0569e1c4.jpg",
"http://santansun.com/wp-content/uploads/2018/11/5b7fdeab1900001d035028dc.jpeg","https://pbs.twimg.com/profile_images/941322358245154816/tF4dPHrS_400x400.jpg","https://www.akc.org/wp-content/themes/akc/component-library/assets/img/welcome.jpg","https://i.kym-cdn.com/entries/icons/facebook/000/010/346/gdggfjjgfjgfgg.jpg","https://midcoasthumane.org/wp-content/uploads/2017/03/dog.png","https://amp.thisisinsider.com/images/5be343aa48eb124cb95de462-750-563.jpg","https://static.businessinsider.com/image/58a5da1f54905724008b509d-750.jpg","https://media4.s-nbcnews.com/i/newscms/2018_02/2285561/180109-dog-listening-mn-1215_86fd9caebf17bddbf5310597b860cef9.jpg","https://media.graytvinc.com/images/810*455/80702E00-SWYQH.jpg","https://www.petmd.com/sites/default/files/bone-inflammation-panosteitis-dogs.jpg","https://hips.hearstapps.com/ghk.h-cdn.co/assets/17/30/pembroke-welsh-corgi.jpg","http://www.petmd.com/sites/default/files/petmd-gabapentin.jpg","https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12233803/Dogue-de-Bordeaux-On-White.jpg","https://www.xinsurance.com/wp-content/uploads/sites/5/2016/06/dog-2.jpg","https://3c1703fe8d.site.internapcdn.net/newman/gfx/news/hires/2016/hereswhatdog.jpg","https://hips.hearstapps.com/ghk.h-cdn.co/assets/18/01/1515005599-miniature-pinscher.jpg","https://d2kl333iheywy2.cloudfront.net/assets/main/lab-hero-square-1fe2f13fa943105fe2c521df43eeb11c.jpg","https://thenypost.files.wordpress.com/2017/12/dog.jpg?quality=90&strip=all&w=618&h=410&crop=1","http://stmedia.stimg.co/ows_153366024340603.jpg?h=630&w=1200&fit=crop&bg=999&crop=faces","https://vmdtoday.s3.amazonaws.com/_media/_image/Dog-Research-Grants_Feature.jpg","https://img.washingtonpost.com/wp-apps/imrs.php?src=https://img.washingtonpost.com/news/post-nation/wp-content/uploads/sites/23/2014/12/PHO-10Sep20-253064.jpg&w=1484","https://static.standard.co.uk/s3fs-public/thumbnails/image/2017/12/01/08/puppy-1624446-1920.jpg?w968","https://c.tribune.com.pk/2018/05/1707952-image-1526063784.jpg","https://www.irishcentral.com/uploads/article/132114/cropped_hamish_train_dog.jpg?t=1554408013","https://www.nova.ie/wp-content/uploads/2018/11/Screenshot_2018-11-03-16-15-51-358_com.whatsapp.jpg","https://agoldphoto.com/wp-content/uploads/2018/01/1_Outdoor-Pet-Photo-Shoot-e1517149615174.jpg","https://thefreethoughtproject.com/wp-content/uploads/2014/04/Happy_golden_dog-696x470.jpg","http://www.womensoutdoornews.com/wp-content/uploads/2015/10/Labrador_Retriever_chocolate_Hershey_sit_cropped-copy.jpg","https://www.certapet.com/wp-content/uploads/2015/08/05-CertaPet-Emotional-Support-Animals-Importance-of-Pet-Adoption.jpg","https://static.boredpanda.com/blog/wp-content/uploads/2016/02/adopt-shelter-dogs-photobooth-humane-society-34__880.jpg"
]

20.times do |i|
  Dog.create!(name: Faker::Creature::Dog.name, age: Random.rand(1..15), breed: Faker::Creature::Dog.breed, size: Faker::Creature::Dog.size, restrictions: @restrictions.sample, friendliness: @friendly.sample, owner_id: @owner_ids.sample, image: dog_pics[i])
end
puts("20 dogs")
10.times do |i|
  Dog.create!(name: Faker::Creature::Dog.name, age: Random.rand(1..15), breed: Faker::Creature::Dog.breed, size: Faker::Creature::Dog.size, restrictions: @restrictions.sample, friendliness: @friendly.sample, owner_id: @owner_ids.sample, image: dog_pics[i+20])
end

puts("10 dogs")
@dog_ids = Dog.pluck(:id)
@experience = ["training", "apprentice", "experienced", "certified"]
@rating = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
@dogs = [true, false]

walker_pics = ["https://images.pexels.com/photos/1109424/pexels-photo-1109424.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/275717/pexels-photo-275717.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/159557/leisure-wildlife-photography-pet-photography-dog-159557.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/1498925/pexels-photo-1498925.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/1757011/pexels-photo-1757011.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500","https://images.pexels.com/photos/1139793/pexels-photo-1139793.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/1831789/pexels-photo-1831789.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/1097551/pexels-photo-1097551.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500","https://images.pexels.com/photos/289252/pexels-photo-289252.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/824255/pexels-photo-824255.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"]

5.times do |i|
  Walker.create!(age: Random.rand(18..40), experience: @experience.sample, rating: @rating.sample, user_id: @user_ids[i+5], own_dog: true, image: walker_pics[i])
end
5.times do |i|
  Walker.create!(age: Random.rand(18..40), experience: @experience.sample, rating: @rating.sample, user_id: @user_ids[i+10], own_dog: false, image: walker_pics[i+5])
end

puts("10 walker")
@walker_ids = Walker.pluck(:id)
@comments = ["Great Walk, would definitly use this walker again", "Walker was late and left my door unlocked", "Okay", "Excellent", "Satisfactory", "Horrible, walker should be fired"]

service_pic = [
  "https://images.pexels.com/photos/533502/pexels-photo-533502.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/1249208/pexels-photo-1249208.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","http://static.cdnbridge.com/resources/18/160536/picture/06/85954310.jpg","https://images.pexels.com/photos/2080850/pexels-photo-2080850.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/998254/pexels-photo-998254.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/218825/pexels-photo-218825.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://www.kivodaily.com/wp-content/uploads/2019/02/z-5.jpg","https://www.pompanopetlodge.com/wp-content/themes/pompanopetlodge/images/3.jpg","http://www.playfulpoochusa.com/mcefiles/The-Dogs-Love-the-New-Turf.jpg","https://images.pexels.com/photos/164446/pexels-photo-164446.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/57627/pexels-photo-57627.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/1831997/pexels-photo-1831997.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/374898/pexels-photo-374898.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
]
#walking
  Service.create!(name: "15 min Walks", bundle: "five", category: "walking", package: "standard", max_time: "quarter", pkg_amount: 35.00, hourly_rate: 7.00, image: service_pic[2])
  Service.create!(name: "30 min Walks", bundle: "fifteen", category: "walking", package: "best", max_time: "half", pkg_amount: 70.00, hourly_rate: 7.00, image: service_pic[1])
  Service.create!(name: "An Hour Out", bundle: "thirty", category: "walking", package: "premium", max_time: "hour", pkg_amount: 105.00, hourly_rate: 7.00, image: service_pic[0])
 puts("service walking")
#daycare 1/2 day
   Service.create!(name: "Halfday-5", bundle: "five", category: "daycare", package: "best", max_time: "halfday", pkg_amount: 90.00, hourly_rate: 18.00, image: service_pic[3])
   Service.create!(name: "Halfday-15", bundle: "fifteen", category: "daycare", package: "premium", max_time: "halfday", pkg_amount: 900.00, hourly_rate: 180.00, image: service_pic[4])
   Service.create!(name: "Halfday-30", bundle: "thirty", category: "daycare", package: "premium", max_time: "halfday", pkg_amount: 1350.00, hourly_rate: 270.00, image: service_pic[5])
    puts("1/2 daycare")
#daycare full day
   Service.create!(name: "Fullday-5", bundle: "five", category: "daycare", package: "best", max_time: "fullday", pkg_amount: 150.00, hourly_rate: 30.00, image: service_pic[6])
   Service.create!(name: "Fullday-15", bundle: "fifteen", category: "daycare", package: "premium", max_time: "fullday", pkg_amount: 900.00, hourly_rate: 300.00, image: service_pic[7])
   Service.create!(name: "Fullday-30", bundle: "thirty", category: "daycare", package: "premium", max_time: "fullday", pkg_amount: 1280.00, hourly_rate: 450.00, image: service_pic[8])
    puts("full daycare")
#inhome
  Service.create!(name: "Inhome halfday", bundle: "one", category: "inhome", package: "standard", max_time: "halfday", pkg_amount: 90.00, hourly_rate: 12.00, image: service_pic[9])
   puts("service inhome")
#overnight
  Service.create!(name: "Inhome overnight", bundle: "one", category: "overnight", package: "standard", max_time: "halfday", pkg_amount: 120.00, hourly_rate: 15.00, image: service_pic[10])
   puts("service overnight")
  Service.create!(name: "Overnight", bundle: "one", category: "overnight", package: "standard", max_time: "halfday", pkg_amount: 90.00, hourly_rate: 12.00, image: service_pic[11])
   puts("service overnight")
   

@service = Service.pluck(:id)

@time = ["6:30", "7:45", "8:15", "9:15", "10:30", "11:15","6:45", "7:30", "8:45", "9:30", "10:45", "11:30" ]

@status =["pending", "confirmed", "cancelled"]

@booked=[true, false]

35.times do
  Appointment.create!(dog_id: @dog_ids.sample, date: Faker::Date.between(1.month.ago, 3.months.from_now), start_time: @time.sample , status: @status.sample, walker_id: @walker_ids.sample, booked: @booked.sample, service_id: @service.sample )
end

 puts("35 appointments")

@total = Service.pluck(:pkg_amount)
@appointments = Appointment.pluck(:id)
@notes = ["dog was great, well trained", "dog is aggressive towards other dogs", "dog does not like to walk a lot", "This is a superfun dog!!", "Awesome walk"]

11.times do |i|
  Invoice.create!(amount: @total[i], appointment_id: @appointments[i],  walked: true, walk_rating: @rating.sample, notes: @notes.sample, owner_comments: @comments.sample, walker_comments: @comments.sample, owner_id: @owner_ids.sample)
end
puts("11 invoices")
11.times do |i|
  Invoice.create!(amount: @total[i], appointment_id: @appointments[i+10],  walked: true, walk_rating: @rating.sample, notes: @notes.sample, owner_comments: @comments.sample, walker_comments: @comments.sample, owner_id: @owner_ids.sample)
end
puts("11 X 2  invoices")
11.times do |i|
  Invoice.create!(amount: @total.sample, appointment_id: @appointments[i+21],  walked: true, walk_rating: @rating.sample, notes: @notes.sample, owner_comments: @comments.sample, walker_comments: @comments.sample, owner_id: @owner_ids.sample)
end
puts("11 X 3 invoices")
2.times do |i|
  Invoice.create!(amount: @total.sample, appointment_id: @appointments[i+32],  walked: true, walk_rating: @rating.sample, notes: @notes.sample, owner_comments: @comments.sample, walker_comments: @comments.sample, owner_id: @owner_ids.sample)
end
puts("last 2 invoices")

 puts("35 invoices")
puts "done"






