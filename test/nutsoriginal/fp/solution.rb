module Nutsoriginal
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        selected = array.select do |item|
          item['country'] &&
            item['country'].split(',').length > 1 &&
            item['rating_kinopoisk'].to_f != 0
        end
        sum = selected.map { |item| item['rating_kinopoisk'].to_f }.reduce(:+)
        sum / selected.length
      end

      def chars_count(films, threshold)
        letter = 'и'

        selected = films.select do |item|
          item['rating_kinopoisk'] &&
            item['rating_kinopoisk'].to_f >= threshold
        end
        selected.map { |item| item['name'].count(letter) }.reduce(:+)
      end
    end
  end
end
