# == Schema Information
#
# Table name: addresses
#
#  city                :string
#  created_at          :datetime         not null
#  id                  :integer          not null, primary key
#  latitude            :decimal(15, 10)
#  longitude           :decimal(15, 10)
#  original_attributes :text
#  state               :string
#  street              :string
#  street2             :string
#  updated_at          :datetime         not null
#  verification_info   :text
#  zip_code            :string
#

class Address < ApplicationRecord
  def full_address
    "#{street}, #{city}, #{state}, #{zip_code}"
  end
end
