class Phonenumber < ActiveRecord::Base
	validates :phonenumber, presence: true
	validates :phonenumber, uniqueness: true
end