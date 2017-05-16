class StaticPagesController < ApplicationController
   def home
      @totalCount = Comment.count
   	one = Comment.where(:team => "House Divided").all
      two = Comment.where(:team => "Blessed Fools").all
      three = Comment.where(:team => "No Pressure").all
      four = Comment.where(:team => "Salt 2.0").all
      five = Comment.where(:team => "Too Easy").all
   	@oneSum = 0;
   	@twoSum = 0;
      @threeSum = 0;
      @fourSum = 0;
      @fiveSum = 0;

   	one.each do |post|
   		@oneSum += post.mission.points
   	end

      two.each do |post|
         @twoSum += post.mission.points
      end

      three.each do |post|
         @threeSum += post.mission.points
      end

      four.each do |post|
         @fourSum += post.mission.points
      end

      five.each do |post|
         @fiveSum += post.mission.points
      end

      @points = [['House Divided', @oneSum], ['Blessed Fools', @twoSum], ['No Pressure', @threeSum], ['Salt 2.0', @fourSum], ["Too Easy (Staff)", @fiveSum]].sort do |a, b|
         b[1] <=> a[1]
      end

      @winner = @points.delete_at(0)

   	@comment = Comment.new

      @sd = Mission.where(:category_id => Category.where(:mission_type => "Spiritual Discipline").first.id)
      @evangelism = Mission.where(:category_id => Category.where(:mission_type => "Evangelism").first.id)
      @ser = Mission.where(:category_id => Category.where(:mission_type => "Service").first.id)
      @eq = Mission.where(:category_id => Category.where(:mission_type => "Equipping").first.id)
   end

   def more
   	@sd = Mission.where(:category_id => Category.where(:mission_type => "Spiritual Discipline").first.id)
   	@evangelism = Mission.where(:category_id => Category.where(:mission_type => "Evangelism").first.id)
   	@service = Mission.where(:category_id => Category.where(:mission_type => "Service").first.id)
   	@equip = Mission.where(:category_id => Category.where(:mission_type => "Equipping").first.id)
   end

   def team
      @one = ['Shannon', 'Derek', 'Vincent', 'Tiger', 'Helen', 'Diamond', 'Angela']
      @two = ['Christine', 'Nick', 'Chris', 'Albert', 'Younie', 'Dorothy', 'Rex']
      @three = ['Karen', 'Jeff', 'David', 'Neida', 'Anastasia', 'Grace', 'Cindy']
      @four = ['Tim', 'Stone', 'Sean', 'Jocelyn', 'Eleanor', 'Michelle', 'Emali', 'Erika']
      @five = ['Jenny', 'Kevan', 'Fan', 'John', 'Adeline', 'Alex']
   end

   def completed
      @comments = Comment.page(params[:page]).order('created_at DESC')
   end 

   def powerranking
      names = Comment.uniq.pluck(:name)
   end

end
