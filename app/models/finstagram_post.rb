class FinstagramPost < ActiveRecord::Base

  belongs_to :user
  has_many :comments
  has_many :likes

  validates_presence_of :user

  def humanized_time_ago
    time_ago_in_seconds = Time.now - self.created_at
    time_ago_in_minutes = time_ago_in_seconds / 60

    if time_ago_in_minutes >= 60
      time_ago_in_hours = time_ago_in_minutes / 60

      if time_ago_in_hours >= 24
        time_ago_in_days = time_ago_in_hours / 24
        "#{time_ago_in_days.to_i} days ago"
      else
        "#{time_ago_in_hours.to_i} hours ago"
      end
    else
      "#{time_ago_in_minutes.to_i} minutes ago"
    end
  end

  def like_count
    self.likes.size
  end

  def comment_count
    self.comments.size
  end

end
  