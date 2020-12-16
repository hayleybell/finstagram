class FinstagramPost < ActiveRecord::Base

  belongs_to :user
  has_many :comments
  has_many :likes

  validates_presence_of :user
  validates :photo_url, :user, presence: true

  def humanized_time_ago
    time_ago_in_seconds = Time.now - self.created_at
    time_ago_in_minutes = time_ago_in_seconds / 60

    if time_ago_in_minutes >= 60
      time_ago_in_hours = time_ago_in_minutes / 60

      if time_ago_in_hours >= 24
        time_ago_in_days = time_ago_in_hours / 24

        if time_ago_in_days >= 7
            time_ago_in_weeks = time_ago_in_days / 7
            print_time_ago(time_ago_in_weeks, "week")
        else
            print_time_ago(time_ago_in_days, "day")
        end
      else
        print_time_ago(time_ago_in_hours, "hour")
      end
    else
      print_time_ago(time_ago_in_minutes, "minute")
    end
  end

  def print_time_ago(value, unit)
    rounded_value = value.to_i
    plural_unit = rounded_value == 1 ? unit : unit + "s"
    "#{rounded_value} #{plural_unit} ago"
  end

  def like_count
    self.likes.size
  end

  def comment_count
    self.comments.size
  end

end
  