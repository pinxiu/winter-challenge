class StaticPagesController < ApplicationController
   def home
      @totalCount = Comment.count
      one = Comment.where(:team => "Brothers").all
      two = Comment.where(:team => "Sisters").all
   	@oneSum = 0;
   	@twoSum = 0;
    
    @multiply = 0;
           
   	one.each do |post|
        @multiply = begin
            Integer(post.multiplier)
        rescue
            1
        end
        
   		@oneSum += post.mission.points * @multiply
        if post.is_type_of_video? 
            @oneSum += 10 * @multiply
        elsif post.is_type_of_image?
            @oneSum += 5 * @multiply
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
            @twoSum += 10 * @multiply
        elsif post.is_type_of_image?
            @twoSum += 5 * @multiply
        else 
            @twoSum += 0 * @multiply
        end
    end

      @points = [['Brothers', @oneSum], ['Sisters', @twoSum]].sort do |a, b|
         b[1] <=> a[1]
      end

      @winner = @points.delete_at(0)

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
      #@one = ['Kevan', 'Jon Kim', 'Will', 'Alex', 'Josh Joo', 'Kevin Stock', 'Daniel Liu', 'Godwin Law', 'Jonathan Chen']
      #@two = ['Jenny', 'Kat Kim', 'Alex', 'Adeline', 'Huizhen', 'Dasol', 'Vivian L', 'Jennifer Li', 'Stella Oh', 'Michelle Kim', 'Vanessa', 'Mira Chiu', 'Katherine Cai']
      
      @totalCount = Comment.count
      one = Comment.where(:team => "Brothers").all
      two = Comment.where(:team => "Sisters").all
      @oneSum = 0;
      @twoSum = 0;

   	one.each do |post|
        @multiply = begin
            Integer(post.multiplier)
        rescue
            1
        end
        
   		@oneSum += post.mission.points  * @multiply
        if post.is_type_of_video? 
            @oneSum += 10 * @multiply
        elsif post.is_type_of_image?
            @oneSum += 5 * @multiply
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
            @twoSum += 10 * @multiply
        elsif post.is_type_of_image?
            @twoSum += 5 * @multiply
        else 
            @twoSum += 0 * @multiply
        end
    end
       

      @points = [['Brothers', @oneSum], ['Sisters', @twoSum]].sort do |a, b|
         b[1] <=> a[1]
      end

      # @points = [[team, pointSum],...]

      @winner = @points.delete_at(0)
       
       @oneStat = @oneSum / 20
       @twoStat = @twoSum / 20
       
       @barOne = @oneStat + 5
       @barTwo = @twoStat + 5
       
   end

   def completed
      @comments = Comment.page(params[:page]).order('created_at DESC')
   end 

   def powerranking
      names = Comment.uniq.pluck(:name)
   end

end
