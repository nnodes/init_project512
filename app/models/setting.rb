class Setting < ApplicationRecord
  validates :code, uniqueness: true

  @@settings = nil

  def self.integer_accepted_values
    []
  end
  def self.double_accepted_values
    []
  end
  def self.text_accepted_values
    ['example']
  end
  def self.date_accepted_values
    []
  end

  def self.value(code)
    code = code.to_s
    unless @@settings
      Setting.load_settings
    end
    if c = @@settings[code]
      c.value
    else
      if Setting.integer_accepted_values.include? code
        0
      elsif Setting.double_accepted_values.include? code
        0
      elsif Setting.text_accepted_values.include? code
        ""
      elsif Setting.date_accepted_values.include? code
        ""
      else
        nil
      end
    end
  end

  def value
    if Setting.integer_accepted_values.include? self.code
      self.number_value.to_i
    elsif Setting.double_accepted_values.include? self.code
      self.number_value
    elsif Setting.text_accepted_values.include? self.code
      self.text_value
    elsif Setting.date_accepted_values.include? self.code
      self.date_value
    else
      nil
    end
  end

  def self.load_settings
    @@settings = Hash.new
    Setting.all.each do |c|
      @@settings[c.code] = c
    end
  end
end
