holiday_hash = {
  :winter => {
    :christmas => ["Lights", "Wreath"],
    :new_years => ["Party Hats"]
  },
  :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"]
  },
  :fall => {
    :thanksgiving => ["Turkey"]
  },
  :spring => {
    :memorial_day => ["BBQ"]
  }
}

def second_supply_for_fourth_of_july(holiday_hash)
  return holiday_hash[:summer][:fourth_of_july][1]
end


def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].each do |holiday, supplies|
    supplies << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end


def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  return holiday_hash
end


def all_winter_holiday_supplies(holiday_hash)
  new_array = []
  holiday_hash[:winter].each do |holiday, supplies|
    supplies.each do |supply|
      new_array << supply
    end
  end
  return new_array
end

def all_supplies_in_holidays(holiday_hash)
  result = "" 
  holiday_hash.each do |season, holiday|
   
    season = season.to_s
    season.capitalize!
    result << "#{season}:\n"
    holiday.each do |feast, supplies|
      feast = feast.to_s
      if feast.include?("_")
        split_holiday = feast.split("_")
        split_holiday = split_holiday.collect do |word|
          word.capitalize
        end
        joined_holiday = split_holiday.join(" ")
        result << "  " + joined_holiday + ": " 
      else 
        result << "  " + feast.capitalize + ": "
      end #end if
      result << supplies.join(", ") + "\n"

    end #end holiday each
  end
  puts result
end

all_supplies_in_holidays(holiday_hash)

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  answer = [ ]
  holiday_hash.each do |season, holiday|
    holiday.each do |feast, supplies|
      if supplies.include?("BBQ")
        answer << feast
      end
    end
  end
  return answer
end









