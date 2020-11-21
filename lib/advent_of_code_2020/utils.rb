module AdventOfCode2020
  module Utils
    def self.read_file(file_name)
      path = File.join(ROOT, "/", file_name)
      lines = File.readlines(path)

      lines
        .compact
        .map(&:strip)
        .select { |line| !line.empty? }
    end
  end
end
