class BikeLanesMapController < ApplicationController
  def index
    @galytsky_district_bike_route_url = 'https://www.google.com/maps/d/embed?mid=1T16A94lfQWm8QMfjKIY9lb36DNI'
    @zaliznychny_district_bike_route_url = 'https://www.google.com/maps/d/embed?mid=1_DYQaql4eVSHB4oXMmp-RI1m9rg'
    @shevchenko_district_bike_route_url = 'https://www.google.com/maps/d/embed?mid=1enP_u0_urXcWx3AE7nOI2j6ko0A'
    @frankivsky_district_bike_route_url = 'https://www.google.com/maps/d/embed?mid=1wvO5Nnbam2eueteDOTwKBjKEfDc'
    @sychivsky_district_bike_route_url = 'https://www.google.com/maps/d/embed?mid=1dxS0jPcaKFOM86iv0O4qBsayLuE'
    @lychakivsky_district_bike_route_url = 'https://www.google.com/maps/d/embed?mid=1uPcvnQ7vpD0c90YeH5oR7zfVndk'
  end
end
