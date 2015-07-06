class Job < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :description, :company, :url, :city, :category, :user
end