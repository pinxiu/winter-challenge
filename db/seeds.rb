# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.delete_all
Mission.delete_all
Category.delete_all
Player.delete_all
Team.delete_all

dbr = Category.create!(mission_type: 'Bible reading')
dwp = Category.create!(mission_type: 'Prayer')
poc = Category.create!(mission_type: 'Reaching out')
lss = Category.create!(mission_type: 'Skills for serving')
fif = Category.create!(mission_type: '“Fasting” / Focus')
exe = Category.create!(mission_type: 'Exercise')
pmt = Category.create!(mission_type: 'Message / Talk')

# Daily Bible reading
Mission.create!(name: 'Daily Points: Read the day’s passage from igsm.link/bible-reading-plan (usually 3-5 chapters) and remember a key verse', points: 10, category: dbr)
Mission.create!(name: 'One time points: If you complete all the reading for the 40 days', points: 40, category: dbr)


# Daily and weekly prayer
Mission.create!(name: 'Daily Points: 15 minutes of prayer using a prayer guide or by joining the guided prayer time', points: 10, category: dwp)
Mission.create!(name: 'Weekly Points: 30 minute prayer time with prayer partner', points: 20, category: dwp)
Mission.create!(name: 'One time points: 30 minute campus prayer walk. Can be any college or university campus.', points: 40, category: dwp)


# Plan and put on an outreach activity
Mission.create!(name: 'One time points: With your team, plan out one outreach activity (to meet new students)', points: 100, category: poc)
Mission.create!(name: 'One time points: With your team, do the outreach activity you planned', points: 100, category: poc)


# Learn skills for serving
Mission.create!(name: 'One time points: Complete an online course that we offer on skills', points: 50, category: lss)


# “Fasting” to increase focus
Mission.create!(name: 'Daily Points: Cut out one habitual activity that will help you to be more spiritually alert.', points: 10, category: fif)

# Exercise
Mission.create!(name: 'Daily Points: 15 minutes of exercise (if you didn’t sweat, then it’s not exercise)', points: 10, category: exe)

# Prepare a message / special talk
Mission.create!(name: 'One time points: Prepare and give a presentation - First complete draft of talk / slides', points: 100, category: pmt)
Mission.create!(name: 'One time points: Prepare and give a presentation - Dry runs and completion of final draft  / slides', points: 100, category: pmt)
Mission.create!(name: 'One time points: Prepare and give a presentation - Video recording of presentation', points: 100, category: pmt)

# Create Teams
team_jeff = Team.create!(name: 'Team Some Men')
team_jisup = Team.create!(name: 'Ordinary Men')
team_gary = Team.create!(name: 'Team Zed')
team_adam = Team.create!(name: 'Team Young and Free')
team_sara = Team.create!(name: 'Full Measure')
team_ella = Team.create!(name: 'Sent')
team_lynn = Team.create!(name: 'Team Winner Challenge')

# Create Team Member

jeff = Player.create!(name: 'Jeff Chiu', team: team_jeff)
jerry = Player.create!(name: 'Jerry Tai', team: team_jeff)
alvin = Player.create!(name: 'Alvin Tan', team: team_jeff)

jisup = Player.create!(name: 'Jisup Hong', team: team_jisup)
mark = Player.create!(name: 'Mark Borja', team: team_jisup)

gary = Player.create!(name: 'Gary Zhao', team: team_gary)
bryan = Player.create!(name: 'Bryan Zheng', team: team_gary)
rick = Player.create!(name: 'Rick Zhong', team: team_gary)
sean = Player.create!(name: 'Sean Zhang', team: team_gary)

adam = Player.create!(name: 'Adam Kor', team: team_adam)
alan = Player.create!(name: 'Alan Kwok', team: team_adam)
kevin = Player.create!(name: 'Kevin Lee', team: team_adam)
victor = Player.create!(name: 'Youchen (Victor) Zhang', team: team_adam)

sara = Player.create!(name: 'Sara Hong', team: team_sara)
grace = Player.create!(name: 'Grace Borja', team: team_sara)
jilan = Player.create!(name: 'Jilan Zheng', team: team_sara)
summer = Player.create!(name: 'Summer Zhao', team: team_sara)

ella = Player.create!(name: 'Ella Wang', team: team_ella)
phoebe = Player.create!(name: 'Phoebe Gong', team: team_ella)
wenxia = Player.create!(name: 'Wenxia Lin', team: team_ella)

lynn = Player.create!(name: 'Lynn Ma', team: team_lynn)
gia = Player.create!(name: 'Gia Park', team: team_lynn)
jacklyn = Player.create!(name: 'Jacklyn Ang', team: team_lynn)
sophia = Player.create!(name: 'Sophia Huang', team: team_lynn)
