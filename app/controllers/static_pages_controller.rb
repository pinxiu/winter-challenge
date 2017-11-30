class StaticPagesController < ApplicationController
   def home
      @totalCount = Comment.count
   	one = Comment.where(:team => "KJ HG Girls").all
      two = Comment.where(:team => "KJ HG Guys").all
      three = Comment.where(:team => "JI/BE HG Girls").all
      four = Comment.where(:team => "JI/BE HG Guys").all
   	@oneSum = 0;
   	@twoSum = 0;
      @threeSum = 0;
      @fourSum = 0;

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

      @points = [['KJ HG Girls', @oneSum], ['KJ HG Guys', @twoSum], ['JI/BE HG Girls', @threeSum], ['JI/BE HG Guys', @fourSum]].sort do |a, b|
         b[1] <=> a[1]
      end

      @winner = @points.delete_at(0)

   	@comment = Comment.new

      @sd = Mission.where(:category_id => Category.where(:mission_type => "Spiritual Growth").first.id)
      @evangelism = Mission.where(:category_id => Category.where(:mission_type => "Evangelism").first.id)
      @ser = Mission.where(:category_id => Category.where(:mission_type => "Service/Gratitude").first.id)
      @eq = Mission.where(:category_id => Category.where(:mission_type => "Equipping").first.id)
   end

   def more
   	@sd = Mission.where(:category_id => Category.where(:mission_type => "Spiritual Growth").first.id)
   	@evangelism = Mission.where(:category_id => Category.where(:mission_type => "Evangelism").first.id)
   	@service = Mission.where(:category_id => Category.where(:mission_type => "Service/Gratitude").first.id)
   	@equip = Mission.where(:category_id => Category.where(:mission_type => "Equipping").first.id)
   end

   def team
      @one = ['Kevan', 'Jon Kim', 'Will', 'Alex', 'Josh Joo', 'Kevin Stock', 'Daniel Liu', 'Godwin Law', 'Jonathan Chen']
      @two = ['Jenny', 'Kat Kim', 'Alex', 'Adeline', 'Huizhen', 'Dasol', 'Vivian L', 'Jennifer Li', 'Stella Oh', 'Michelle Kim', 'Vanessa', 'Mira Chiu', 'Katherine Cai']
      @three = ['Joe', 'Brian Jue', 'Ivan Yung', 'Jeff W', 'Nathan M', 'Andrew N.', 'Josh Kim', 'David Lee', 'Daniel Shan', 'Matt Estrada', 'Ben VDH', 'Noah Kang']
      @four = ['Irene', 'Ellen Jue', 'San Yung', 'Joyce Cho', 'Joyce Han', 'Nancy P.', 'Claire Lee', 'Kristy J', 'Grace Park', 'Yvonne W', 'Micaela W']
   end

   def completed
      @comments = Comment.page(params[:page]).order('created_at DESC')
   end 

   def powerranking
      names = Comment.uniq.pluck(:name)
   end

end
