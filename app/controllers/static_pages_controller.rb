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

   def completed
      @comments = Comment.page(params[:page]).order('created_at DESC')
   end 

   def powerranking
      names = Comment.uniq.pluck(:name)
   end

end
