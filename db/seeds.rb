File.open("./dataPoints.csv") do |f|
  columns = f.gets.chomp.split(',')

  while !f.eof?
    line = f.gets.chomp.split(',')
    Crime.create!(
      longitude: line[0],
      latitude: line[1],
      year: line[2],
      month: line[3],
      x: line[4],
      y: line[5],
      TOT: line[6],
      crimeType: line[7]
    )
  end
end
