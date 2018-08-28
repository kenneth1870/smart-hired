# == Schema Information
#
# Table name: projects
#
#  buget         :decimal(, )
#  candidate_id  :integer
#  cliente       :string
#  created_at    :datetime         not null
#  description   :text
#  end_date      :datetime
#  id            :bigint(8)        not null, primary key
#  name          :string
#  skills_needed :string           default([]), is an Array
#  start_date    :datetime
#  updated_at    :datetime         not null
#

class Project < ApplicationRecord
  def candidate
    User.find(candidate_id)
  end
end
