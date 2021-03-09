class Cookie < ActiveRecord::Base
  belongs_to :storage, polymorphic: :true
  
  validates :storage, presence: true
  require "byebug"
  def ready?
    if(self.completion_time >= Time.now) 
      return false
    end
    true
  end

  def cooking_time
    time = (self.completion_time - Time.now).to_i
    if (time > 60)
      return "will be ready in #{time.to_i / 60} minute and #{time.to_i % 60} seconds"
    elsif (time > 0)
      return "will be ready in #{time.to_i % 60} seconds"
    else 
      return "is ready"
    end 
  end
end
