class Note < ActiveRecord::Base
	validates :comment, presence: true
end
 