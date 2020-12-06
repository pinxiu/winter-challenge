# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.delete_all
Mission.delete_all

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
