class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # only show non-archived users
  scope :active, lambda { where(archive_at: nil) }

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end

  # archive user, updating/setting archive_at Time
  def archive!
    self.update(archive_at: Time.now)
    # set the current_user archive_at to nil 
    if current_user
      self.archive_at = nil
    end
  end
  # locking out an archived user from signing in
  def active_for_authentication?
    super && archive_at.nil?
  end

  # inactive message override
  def inactive_message
    archive_at.nil? ? super : archived
  end
end
