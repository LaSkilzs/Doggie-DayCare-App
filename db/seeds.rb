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


# We have to iterate through to add user_ids to each owner & walker
10.times do |i|
  Owner.create!(address: Faker::Address.street_address, city: Faker::Address.city, user_id: @user_ids[i])
end

@owner_ids = Owner.pluck(:id)


@friendly = ["aggressive", "untrained", "playful" , "passive", "friendly", "trained"]
@restrictions = ["medication", "dogfood", "diet", "notsocial"]

dog_pics = ["corgi.jpg", "eskimo.jpg", "husky.jpg", "lab.jpg", "lab_pup.jpg", "malamute.jpg", "malamute_pup.jpg", "chow.jpg", "chowbaby.jpg"]

20.times do
  Dog.create!(name: Faker::Creature::Dog.name, age: Random.rand(1..15), breed: Faker::Creature::Dog.breed, size: Faker::Creature::Dog.size, restrictions: @restrictions.sample, friendliness: @friendly.sample, owner_id: @owner_ids.sample, image: dog_pics.shuffle.sample)
end
puts("20 dogs")
10.times do
  Dog.create!(name: Faker::Creature::Dog.name, age: Random.rand(1..15), breed: Faker::Creature::Dog.breed, size: Faker::Creature::Dog.size, restrictions: @restrictions.sample, friendliness: @friendly.sample, owner_id: @owner_ids.sample, image: dog_pics.shuffle.sample)
end

puts("10 dogs")
@dog_ids = Dog.pluck(:id)
@experience = ["training", "apprentice", "experienced", "certified"]
@rating = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
@dogs = [true, false]



5.times do |i|
  Walker.create!(age: Random.rand(18..40), experience: @experience.sample, rating: @rating.sample, user_id: @user_ids[i+5], own_dog: true)
end
5.times do |i|
  Walker.create!(age: Random.rand(18..40), experience: @experience.sample, rating: @rating.sample, user_id: @user_ids[i+10], own_dog: false)
end

puts("10 walker")
@walker_ids = Walker.pluck(:id)
@comments = ["Great Walk, would definitly use this walker again", "Walker was late and left my door unlocked", "Okay", "Excellent", "Satisfactory", "Horrible, walker should be fired"]



#walking
  Service.create!(name: "walking", bundle: 5, category: "package", package: "standard", max_time: 15, pkg_amount: 35.00, hourly_rate: 7.00)
  Service.create!(name: "walking", bundle: 5, category: "package", package: "best", max_time: 30, pkg_amount: 49.00, hourly_rate: 9.80)
  
  Service.create!(name: "walking", bundle: 5, category: "package", package: "premium", max_time: 60, pkg_amount: 70.00, hourly_rate: 14.00)
 puts("service walking")
#daycare 1/2 day
   Service.create!(name: "daycare", bundle: 1, category: "package", package: "standard", max_time: 12, pkg_amount: 180.00, hourly_rate: 18.00)
   Service.create!(name: "daycare", bundle: 1, category: "package", package: "best", max_time: 12, pkg_amount: 225.00, hourly_rate: 18.00)
   Service.create!(name: "daycare", bundle: 1, category: "package", package: "premium", max_time: 12, pkg_amount: 550.00, hourly_rate: 18.00)
    puts("1/2 daycare")
#daycare full day
   Service.create!(name: "daycare", bundle: 1, category: "package", package: "standard", max_time: 24, pkg_amount: 300.00, hourly_rate: 30.00)
   Service.create!(name: "daycare", bundle: 1, category: "package", package: "best", max_time: 24, pkg_amount:450.00, hourly_rate: 30.00)
   Service.create!(name: "daycare", bundle: 1, category: "package", package: "premium", max_time: 24, pkg_amount: 900.00, hourly_rate: 30.00)
    puts("full daycare")
#inhome
  Service.create!(name: "inhome", bundle: 1, category: "rate", package: "standard", max_time: 12, pkg_amount: 144.00, hourly_rate: 12.00)
   puts("service inhome")
#overnight
  Service.create!(name: "inhome", bundle: 1, category: "rate", package: "standard", max_time: 12, pkg_amount: 180.00, hourly_rate: 15.00)
   puts("service overnight")

@service = Service.pluck(:id)

@time = ["6:30", "7:45", "8:15", "9:15", "10:30", "11:15","6:45", "7:30", "8:45", "9:30", "10:45", "11:30" ]

@status =["pending", "confirmed", "cancelled", "completed"]

35.times do
  Appointment.create!(dog_id: @dog_ids.sample, date: Faker::Date.between(6.months.ago, 1.year.from_now), start_time: @time.sample , status: @status.sample, walker_id: @walker_ids.sample, service_id: @service.sample )
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
