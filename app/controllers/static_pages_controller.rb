class StaticPagesController < ApplicationController
   def home
      @totalCount = Comment.count
      one = Comment.where(:team => "A2F Bros").all
      two = Comment.where(:team => "A2F Sis").all
      three = Comment.where(:team => "Klesis Bros").all
      four = Comment.where(:team => "Klesis Sis").all
      five = Comment.where(:team => "MakeNew Bros").all
      six = Comment.where(:team => "MakeNew Sis").all
   	@oneSum = 0;
   	@twoSum = 0;
	@threeSum = 0;
	@fourSum = 0;
	@fiveSum = 0;
	@sixSum = 0;

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

      @points = [['A2F Bros', @oneSum], ['A2F Sis', @twoSum], ['Klesis Bros', @threeSum], ['Klesis Sis', @fourSum], ['MakeNew Bros', @fiveSum], ['MakeNew Sis', @sixSum]].sort do |a, b|
         b[1] <=> a[1]
      end

      @winner = @points.delete_at(0)
	def new
	 @comment = Comment.new
	end	

   end

   def challenges
   	@sg = Mission.where(:category_id => Category.where(:mission_type => "Spiritual Growth").first.id)
   	@evangelism = Mission.where(:category_id => Category.where(:mission_type => "Evangelism").first.id)
   	@service = Mission.where(:category_id => Category.where(:mission_type => "Service/Gratitude").first.id)
   	@equip = Mission.where(:category_id => Category.where(:mission_type => "Equipping").first.id)
   end

   def stats
      #@one = ['Kevan', 'Jon Kim', 'Will', 'Alex', 'Josh Joo', 'Kevin Stock', 'Daniel Liu', 'Godwin Law', 'Jonathan Chen']
      #@two = ['Jenny', 'Kat Kim', 'Alex', 'Adeline', 'Huizhen', 'Dasol', 'Vivian L', 'Jennifer Li', 'Stella Oh', 'Michelle Kim', 'Vanessa', 'Mira Chiu', 'Katherine Cai']
      #@three = ['Joe', 'Brian Jue', 'Ivan Yung', 'Jeff W', 'Nathan M', 'Andrew N.', 'Josh Kim', 'David Lee', 'Daniel Shan', 'Matt Estrada', 'Ben VDH', 'Noah Kang']
      #@four = ['Irene', 'Ellen Jue', 'San Yung', 'Joyce Cho', 'Joyce Han', 'Nancy P.', 'Claire Lee', 'Kristy J', 'Grace Park', 'Yvonne W', 'Micaela W']

      @totalCount = Comment.count
      one = Comment.where(:team => "A2F Bros").all
      two = Comment.where(:team => "A2F Sis").all
      three = Comment.where(:team => "Klesis Bros").all
      four = Comment.where(:team => "Klesis Sis").all
      five = Comment.where(:team => "MakeNew Bros").all
      six = Comment.where(:team => "MakeNew Sis").all
      @oneSum = 0;
      @twoSum = 0;
      @threeSum = 0;
      @fourSum = 0;
      @fiveSum = 0;
      @sixSum = 0;

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

      six.each do |post|
         @sixSum += post.mission.points
      end

      @points = [['A2F Bros', @oneSum], ['A2F Sis', @twoSum], ['Klesis Bros', @threeSum], ['Klesis Sis', @fourSum], ['MakeNew Bros', @fiveSum], ['MakeNew Sis', @sixSum]].sort do |a, b|
         b[1] <=> a[1]
      end

      # @points = [[team, pointSum],...]

      @winner = @points.delete_at(0)

   end

   def completed
      @comments = Comment.page(params[:page]).order('created_at DESC')
   end 

   def powerranking
      names = Comment.uniq.pluck(:name)
   end

end
