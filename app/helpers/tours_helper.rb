module ToursHelper
  def search_title
    'Экскурсионные автобусные туры'
  end

  def spell_currency
    if @special_price.present?
      last_dig = @special_price.price % 10
      currency = @special_price.currency
    else
      if @price.present?
        last_dig = @price.price % 10
        currency = @price.currency
      else
        return nil
      end
    end

    case currency
      when '$'
        if last_dig == 1
          'доллар'
        else
          if last_dig > 1 && last_dig < 5
            'доллара'
          else
            'долларов'
          end
        end
      when '€'
        'евро'
    end
  end
end
