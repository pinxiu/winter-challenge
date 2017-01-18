class StaticPagesController < ApplicationController
   def home
      @totalCount = Comment.count
   	broPosts = Comment.where(:team => "Bro").all
      sisPosts = Comment.where(:team => "Sis").all
   	@broSum = 0;
   	@sisSum = 0;

   	broPosts.each do |broPost|
   		@broSum += broPost.mission.points
   	end

      sisPosts.each do |sisPost|
        @sisSum += sisPost.mission.points
      end

   	@comment = Comment.new

      @bibleDisciplines = Mission.where(:category_id => Category.where(:mission_type => "Bible/Disciplines").first.id)
      @evangelisms = Mission.where(:category_id => Category.where(:mission_type => "Evangelism").first.id)
      @services = Mission.where(:category_id => Category.where(:mission_type => "Service").first.id)
      @readings = Mission.where(:category_id => Category.where(:mission_type => "Reading").first.id)
      @miscs = Mission.where(:category_id => Category.where(:mission_type => "Miscellaneous").first.id)
   end

   def more
   	bibleDisciplines = Mission.where(:category_id => Category.where(:mission_type => "Bible/Disciplines").first.id)
   	@bibleDisciplines = bibleDisciplines.in_groups(2)
   	@evangelisms = Mission.where(:category_id => Category.where(:mission_type => "Evangelism").first.id)
   	@services = Mission.where(:category_id => Category.where(:mission_type => "Service").first.id)
   	@readings = Mission.where(:category_id => Category.where(:mission_type => "Reading").first.id)
   	@miscs = Mission.where(:category_id => Category.where(:mission_type => "Miscellaneous").first.id)
   end

   def completed
      @comments = Comment.page(params[:page]).order('created_at DESC')
   end 

   def powerranking
      names = Comment.uniq.pluck(:name)
   end

end
