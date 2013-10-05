module ToursHelper
  def search_title
    'Экскурсионные автобусные туры'
  end

  def spell_currency
    last_dig = @special_price.price % 10
    case @special_price.currency
    when '$'
      if last_dig == 1
        'доллар!'
      else
        if last_dig > 1 && last_dig < 5
          'доллара!'
        else
          'долларов!'
        end
      end
    when '€'
      'евро!'
    end
  end
end
