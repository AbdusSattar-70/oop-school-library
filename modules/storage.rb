require_relative 'date'
class Storage
  def read_file(file)
    @file = File.open(JSON.parse(file))
    @file.read
  end

  def write_file(file,data)
    File.write(file,JSON.generate(data))
  end
end