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
      # TODO Edit these to the IGSM categories
      @sg = Mission.where(:category_id => Category.where(:mission_type => "Spiritual Growth").first.id)
      @evangelism = Mission.where(:category_id => Category.where(:mission_type => "Evangelism").first.id)
      @ser = Mission.where(:category_id => Category.where(:mission_type => "Service/Gratitude").first.id)
      @eq = Mission.where(:category_id => Category.where(:mission_type => "Equipping").first.id)
   end

   def challenges
    # TODO Edit these to the IGSM categories
   	@sg = Mission.where(:category_id => Category.where(:mission_type => "Spiritual Growth").first.id)
   	@evangelism = Mission.where(:category_id => Category.where(:mission_type => "Evangelism").first.id)
   	@service = Mission.where(:category_id => Category.where(:mission_type => "Service/Gratitude").first.id)
   	@equip = Mission.where(:category_id => Category.where(:mission_type => "Equipping").first.id)
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
