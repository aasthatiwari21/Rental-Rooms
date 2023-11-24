class CleanupJob < ApplicationJob
  queue_as :default
  debugger
  

  def perform()
    puts "HElloooo"
  end
end
