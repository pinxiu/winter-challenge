class StaticPagesController < ApplicationController
   def home
      @totalCount = Comment.count
      one = Comment.where(:team => "Team Some Men").all
      two = Comment.where(:team => "Ordinary Men").all
      three = Comment.where(:team => "Team Zed").all
      four = Comment.where(:team => "Team Young and Free").all
      five = Comment.where(:team => "Team Sara").all
      six = Comment.where(:team => "Team Ella").all
      seven = Comment.where(:team => "Team Lynn").all
   	@oneSum = 0;
   	@twoSum = 0;
    @threeSum = 0;
    @fourSum = 0;
    @fiveSum = 0;
    @sixSum = 0;
    @sevenSum = 0;
    
    @multiply = 0;
           
   	one.each do |post|
        @multiply = begin
            Integer(post.multiplier)
        rescue
            1
        end
        
   		@oneSum += post.mission.points * @multiply
        if post.is_type_of_video? 
            @oneSum += 3 * @multiply
        elsif post.is_type_of_image?
            @oneSum += 2 * @multiply
        else 
            @oneSum += 0 * @multiply
        end
   	end

    two.each do |post|
        @multiply = begin
            Integer(post.multiplier)
        rescue
            1
        end
        
        @twoSum += post.mission.points * @multiply
        if post.is_type_of_video? 
            @twoSum += 3 * @multiply
        elsif post.is_type_of_image?
            @twoSum += 2 * @multiply
        else 
            @twoSum += 0 * @multiply
        end
    end

    three.each do |post|
        @multiply = begin
            Integer(post.multiplier)
        rescue
            1
        end
        
      @threeSum += post.mission.points * @multiply
        if post.is_type_of_video? 
            @threeSum += 3 * @multiply
        elsif post.is_type_of_image?
            @threeSum += 2 * @multiply
        else 
            @threeSum += 0 * @multiply
        end
    end

    four.each do |post|
        @multiply = begin
            Integer(post.multiplier)
        rescue
            1
        end
        
        @fourSum += post.mission.points * @multiply
        if post.is_type_of_video? 
            @fourSum += 3 * @multiply
        elsif post.is_type_of_image?
            @fourSum += 2 * @multiply
        else 
            @fourSum += 0 * @multiply
        end
    end

    five.each do |post|
        @multiply = begin
            Integer(post.multiplier)
        rescue
            1
        end
        
      @fiveSum += post.mission.points * @multiply
        if post.is_type_of_video? 
            @fiveSum += 3 * @multiply
        elsif post.is_type_of_image?
            @fiveSum += 2 * @multiply
        else 
            @fiveSum += 0 * @multiply
        end
    end

    six.each do |post|
        @multiply = begin
            Integer(post.multiplier)
        rescue
            1
        end
        
        @sixSum += post.mission.points * @multiply
        if post.is_type_of_video? 
            @sixSum += 3 * @multiply
        elsif post.is_type_of_image?
            @sixSum += 2 * @multiply
        else 
            @sixSum += 0 * @multiply
        end
    end

    seven.each do |post|
        @multiply = begin
            Integer(post.multiplier)
        rescue
            1
        end
        
      @sevenSum += post.mission.points * @multiply
        if post.is_type_of_video? 
            @sevenSum += 3 * @multiply
        elsif post.is_type_of_image?
            @sevenSum += 2 * @multiply
        else 
            @sevenSum += 0 * @multiply
        end
    end

      @points = [['Team Some Men', @oneSum], ['Ordinary Men', @twoSum], ['Team Zed', @threeSum], ['Team Young and Free', @fourSum], ['Team Sara', @fiveSum], ['Team Ella', @sixSum], ['Team Lynn', @sevenSum]].sort do |a, b|
         b[1] <=> a[1]
      end

      @winner = @points.delete_at(0)

      @jeff = Player.where(:team_id => Team.where(:name => "Team Some Men").first.id)
      @jisup = Player.where(:team_id => Team.where(:name => "Ordinary Men").first.id)
      @gary = Player.where(:team_id => Team.where(:name => "Team Zed").first.id)
      @adam = Player.where(:team_id => Team.where(:name => "Team Young and Free").first.id)
      @sara = Player.where(:team_id => Team.where(:name => "Team Sara").first.id)
      @ella = Player.where(:team_id => Team.where(:name => "Team Ella").first.id)
      @lynn = Player.where(:team_id => Team.where(:name => "Team Lynn").first.id)

   	@comment = Comment.new
      @homedbr = Mission.where(:category_id => Category.where(:mission_type => "Bible reading").first.id)
      @homedwp = Mission.where(:category_id => Category.where(:mission_type => "Prayer").first.id)
      @homepoc = Mission.where(:category_id => Category.where(:mission_type => "Reaching out").first.id)
      @homelss = Mission.where(:category_id => Category.where(:mission_type => "Skills for serving").first.id)
      @homefif = Mission.where(:category_id => Category.where(:mission_type => "“Fasting” / Focus").first.id)
      @homeexe = Mission.where(:category_id => Category.where(:mission_type => "Exercise").first.id)
      @homepmt = Mission.where(:category_id => Category.where(:mission_type => "Message / Talk").first.id)
   end

   def challenges
      @challengedbr = Mission.where(:category_id => Category.where(:mission_type => "Bible reading").first.id)
      @challengedwp = Mission.where(:category_id => Category.where(:mission_type => "Prayer").first.id)
      @challengepoc = Mission.where(:category_id => Category.where(:mission_type => "Reaching out").first.id)
      @challengelss = Mission.where(:category_id => Category.where(:mission_type => "Skills for serving").first.id)
      @challengefif = Mission.where(:category_id => Category.where(:mission_type => "“Fasting” / Focus").first.id)
      @challengeexe = Mission.where(:category_id => Category.where(:mission_type => "Exercise").first.id)
      @challengepmt = Mission.where(:category_id => Category.where(:mission_type => "Message / Talk").first.id)
   end

   def stats   
      @totalCount = Comment.count
      one = Comment.where(:team => "Team Some Men").all
      two = Comment.where(:team => "Ordinary Men").all
      three = Comment.where(:team => "Team Zed").all
      four = Comment.where(:team => "Team Young and Free").all
      five = Comment.where(:team => "Team Sara").all
      six = Comment.where(:team => "Team Ella").all
      seven = Comment.where(:team => "Team Lynn").all
      @oneSum = 0;
      @twoSum = 0;
      @threeSum = 0;
      @fourSum = 0;
      @fiveSum = 0;
      @sixSum = 0;
      @sevenSum = 0;

   	one.each do |post|
        @multiply = begin
            Integer(post.multiplier)
        rescue
            1
        end
        
   		@oneSum += post.mission.points  * @multiply
        if post.is_type_of_video? 
            @oneSum += 3 * @multiply
        elsif post.is_type_of_image?
            @oneSum += 2 * @multiply
        else 
            @oneSum += 0 * @multiply
        end
   	end

    two.each do |post|
        @multiply = begin
            Integer(post.multiplier)
        rescue
            1
        end
        
        @twoSum += post.mission.points  * @multiply
        if post.is_type_of_video? 
            @twoSum += 3 * @multiply
        elsif post.is_type_of_image?
            @twoSum += 2 * @multiply
        else 
            @twoSum += 0 * @multiply
        end
    end

    three.each do |post|
        @multiply = begin
            Integer(post.multiplier)
        rescue
            1
        end
        
      @threeSum += post.mission.points  * @multiply
        if post.is_type_of_video? 
            @threeSum += 3 * @multiply
        elsif post.is_type_of_image?
            @threeSum += 2 * @multiply
        else 
            @threeSum += 0 * @multiply
        end
    end

    four.each do |post|
        @multiply = begin
            Integer(post.multiplier)
        rescue
            1
        end
        
        @fourSum += post.mission.points  * @multiply
        if post.is_type_of_video? 
            @fourSum += 3 * @multiply
        elsif post.is_type_of_image?
            @fourSum += 2 * @multiply
        else 
            @fourSum += 0 * @multiply
        end
    end

    five.each do |post|
        @multiply = begin
            Integer(post.multiplier)
        rescue
            1
        end
        
      @fiveSum += post.mission.points  * @multiply
        if post.is_type_of_video? 
            @fiveSum += 3 * @multiply
        elsif post.is_type_of_image?
            @fiveSum += 2 * @multiply
        else 
            @fiveSum += 0 * @multiply
        end
    end

    six.each do |post|
        @multiply = begin
            Integer(post.multiplier)
        rescue
            1
        end
        
        @sixSum += post.mission.points  * @multiply
        if post.is_type_of_video? 
            @sixSum += 3 * @multiply
        elsif post.is_type_of_image?
            @sixSum += 2 * @multiply
        else 
            @sixSum += 0 * @multiply
        end
    end

    seven.each do |post|
        @multiply = begin
            Integer(post.multiplier)
        rescue
            1
        end
        
      @sevenSum += post.mission.points  * @multiply
        if post.is_type_of_video? 
            @sevenSum += 3 * @multiply
        elsif post.is_type_of_image?
            @sevenSum += 2 * @multiply
        else 
            @sevenSum += 0 * @multiply
        end
    end
       

      @points = [['Team Some Men', @oneSum], ['Ordinary Men', @twoSum], ['Team Zed', @threeSum], ['Team Young and Free', @fourSum], ['Team Sara', @fiveSum], ['Team Ella', @sixSum], ['Team Lynn', @sevenSum]].sort do |a, b|
         b[1] <=> a[1]
      end

      # @points = [[team, pointSum],...]

      @winner = @points.delete_at(0)
       
       @oneStat = @oneSum / 5
       @twoStat = @twoSum / 5
       @threeStat = @threeSum / 5
       @fourStat = @fourSum / 5
       @fiveStat = @fiveSum / 5
       @sixStat = @sixSum / 5
       @sevenStat = @sevenSum / 5
       
       @barOne = @oneStat + 5
       @barTwo = @twoStat + 5
       @barThree = @threeStat + 5
       @barFour = @fourStat + 5
       @barFive = @fiveStat + 5
       @barSix = @sixStat + 5
       @barSeven = @sevenStat + 5
       
   end

   def completed
      @comments = Comment.page(params[:page]).order('created_at DESC')
   end 

   def powerranking
      names = Comment.uniq.pluck(:name)
   end

end
