class StaticPagesController < ApplicationController
   def home
      @totalCount = Comment.count
   	one = Comment.where(:team => "Team 1").all
      two = Comment.where(:team => "Team 2").all
      three = Comment.where(:team => "Team 3").all
   	@oneSum = 0;
   	@twoSum = 0;
      @threeSum = 0;

   	one.each do |post|
   		@oneSum += post.mission.points
   	end

      two.each do |post|
         @twoSum += post.mission.points
      end

      three.each do |post|
         @threeSum += post.mission.points
      end

   	@comment = Comment.new

      @wog = Mission.where(:category_id => Category.where(:mission_type => "Word of God").first.id)
      @evangelism = Mission.where(:category_id => Category.where(:mission_type => "Evangelism").first.id)
      @prayer = Mission.where(:category_id => Category.where(:mission_type => "Prayer").first.id)
      @ser = Mission.where(:category_id => Category.where(:mission_type => "Service").first.id)
      @eq = Mission.where(:category_id => Category.where(:mission_type => "Equipping").first.id)
   end

   def more
   	@wog = Mission.where(:category_id => Category.where(:mission_type => "Word of God").first.id)
   	# @bibleDisciplines = bibleDisciplines.in_groups(2)
   	@evangelism = Mission.where(:category_id => Category.where(:mission_type => "Evangelism").first.id)
   	@service = Mission.where(:category_id => Category.where(:mission_type => "Service").first.id)
   	@prayer = Mission.where(:category_id => Category.where(:mission_type => "Prayer").first.id)
   	@equip = Mission.where(:category_id => Category.where(:mission_type => "Equipping").first.id)
   end

   def completed
      @comments = Comment.page(params[:page]).order('created_at DESC')
   end 

   def powerranking
      names = Comment.uniq.pluck(:name)
   end

end
