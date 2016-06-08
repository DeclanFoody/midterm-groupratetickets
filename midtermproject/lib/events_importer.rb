
class EventsImporter

  def initialize(filename=File.absolute_path('db/data/events.csv'))
    @filename = filename
  end

  def import
    field_names = ['name', 'date', 'num_user', 'reg_price', 'disc_price', 'min_required', 'image_url', 'location']
    puts "Importing events from '#{@filename}'"
    failure_count = 0
    Event.transaction do
      File.open(@filename).each do |line|
        data = line.chomp.split(',')
        attribute_hash = Hash[field_names.zip(data)]
        begin
          Event.create!(attribute_hash)
          print '.'
        rescue ActiveRecord::UnknownAttributeError
          failure_count += 1
          print '!'
        ensure
          STDOUT.flush
        end
      end
    end
    failures = failure_count > 0 ? "(failed to create #{failure_count} event records)" : ''
    puts "\nDONE #{failures}\n\n"
  end

end