# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


SEED_MULTIPLIER = 10;
MOODS = ["happy", "sad"]

User.delete_all
Story.delete_all
Resource.delete_all
Conversation.delete_all
Message.delete_all


User.create(email: "foo@bar.com",
  password: "password",
  password_confirmation: "password",
  age: 65, 
  zip_code: 11111, 
  relationship: "spouse", 
  stage: "middle")


SEED_MULTIPLIER.times do |i|
  u = User.new
  u.email = "caregiver#{i}@email.com"
  u.password = "password"
  u.password_confirmation = "password"
  u.age = rand(50) + 50
  zip_code = 11111
  relationship = "spouse"
  stage = "middle"
  u.save!
end


User.all.each do |user|
  # create 0-5 stories
  rand(6).times do |j|
    user.stories.create!(mood: MOODS.sample, body: "Random story #{j} -" + " blah"*(1 + rand(30)) +".")
  end
end


Story.all.each do |story|
  # grab 0-3 other users to respond with
  responders = User.where('id <> ?', story.user_id).sample(rand(4))
  if responders.count > 0
    responders.each do |responder|
      convo = story.conversations.create!(user_one: story.user, user_two: responder)
      story.resources.create!(body: "https://www.realawesomelink.com")
      convo.messages.create!(user: responder, body: "This link is real awesome!")
    end
  end
end

(SEED_MULTIPLIER**2).times do |n|
  convo = Conversation.all.sample
  
  last_messager = convo.messages.last.user
  new_messager_id = [convo.user_one_id, convo.user_two_id].select { |x| x != last_messager.id }.first
  
  convo.messages.create!(user_id: new_messager_id, body: "I'm responding to you!")
end