class Building < ActiveRecord::Base

  # 50 US states, plus District of Columbia

  STATE_ABBREVIATIONS = %w(AL AK AZ AR CA CO CT DE DC FL GA HI ID IL IN IA
    KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI
    SC SD TN TX UT VT VA WA WV WI WY)

  validates :address, presence: true, format: { with: /\A[0-9]+\s[a-zA-Z]+/,
    message: 'must include number and street name' }
  validates :city, presence: true
  validates :state, presence: true, inclusion: { in: STATE_ABBREVIATIONS }
  validates :zip_code, presence: true, format: { with: /\A\d{5}\z/,
    message: 'must be 5 digits long' }

end
