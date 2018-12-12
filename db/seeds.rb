# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.delete_all
Mission.delete_all

sg = Category.create!(mission_type: 'Spiritual Growth')
ev = Category.create!(mission_type: 'Evangelism')
ser = Category.create!(mission_type: 'Service/Gratitude')
equ = Category.create!(mission_type: 'Equipping')

# service/gratitude
Mission.create!(name: 'Do chores (laundry, dishes, take out the trash) at home (max: 40)', points: 10, category: ser)
Mission.create!(name: 'Write a "Thank you" note to someone who is not your peer', points: 20, category: ser)
Mission.create!(name: 'Learn a new dish', points: 20, category: ser)
Mission.create!(name: '10 Days of Gratitude Journal (10 entries/day)', points: 50, category: ser)
Mission.create!(name: 'Host Dinner for Your Family and/or Friends', points: 60, category: ser)


# evangelism
Mission.create!(name: 'Share the Gospel and/or your testimony with a non-Christian friend or family member', points: 40, category: ev)
Mission.create!(name: 'Bring a non-Christian friend or family member to church!', points: 50, category: ev)
Mission.create!(name: 'Prepare a special talk or presentation on a Christian topic (can do this with your friends)', points: 50, category: ev)
Mission.create!(name: 'Read a Christian book with a non Christian friend or family member', points: 60, category: ev)
Mission.create!(name: 'Give a special talk or presentation on a Christian topic (can do this with your friends)', points: 100, category: ev)
Mission.create!(name: 'Lead a bible study with a non-Christian friend or family member', points: 100, category: ev)


# spiritual growth
Mission.create!(name: 'Read Bible (20 Chapters)', points: 20, category: sg)
Mission.create!(name: 'Memorize a Psalm', points: 25, category: sg)
Mission.create!(name: 'Video Chat with a peer of your LG: Share prayer requests or DT', points: 50, category: sg)
Mission.create!(name: '10 consecutive days of DT', points: 50, category: sg)
Mission.create!(name: 'Outline all 4 Gospels', points: 50, category: sg)
Mission.create!(name: 'Read a Christian book: Write a blurb about it!', points: 50, category: sg)
Mission.create!(name: '10 Min Prayer Daily for a week', points: 50, category: sg)



# physical equipping
Mission.create!(name: '35 push-ups / day', points: 5, category: equ)
Mission.create!(name: 'GO running! (10 pts / 1 mile)', points: 10, category: equ)
Mission.create!(name: 'Join 7 minute workout app, add your LG and do a workout together (in person or via video chat)', points: 25, category: equ)
Mission.create!(name: '5 Day Social/Video Media Fast ', points: 50, category: equ)
Mission.create!(name: '1,000 Pushups (Honor System)', points: 70, category: equ)




