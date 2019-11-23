require 'action_view'
require 'action_view/helpers'

class Cat < ApplicationRecord
include ActionView::Helpers::DateHelper

color = ['black','white','brown','gray']

validates :color, inclusion: color
# validates :sex,  :presence: true,  
validates :sex, inclusion: { in: ["M","F"]}
validates :birth_date, :sex, :name, :color, :description, presence: true


  def age
     time_ago_in_words(birth_date)
  end


end
