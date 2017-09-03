class Reading < ApplicationRecord
    
    
    def self.move_reading
        readings = Reading.all.order(:id)
        current_reading = readings.select{|reading|reading.visible == true}.first
        index = readings.index(current_reading)
        current_reading.visible = false
        current_reading.save
        index += 1
        index = 0 if index >= readings.size 
        current_reading = readings[index]
        current_reading.visible = true
        current_reading.save
    end
        
    
    
    
    
end
