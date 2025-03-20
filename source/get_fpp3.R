#contains dataset used in fpp3
library(fpp3)
#see 2.1
a10 <- PBS %>% 
  filter(ATC2 == "A10") %>% 
  select(Month, Concession, Type, Cost) %>% 
  summarise(TotalC = sum(Cost)) %>% 
  mutate(Cost = TotalC/1e6)
  
#############################################################################  
#see 2.1
#contains 64 separate time series corresponding to the combinations of 
#the 8 states, 2 genders, 2 legal statuses and 2 indigenous statuses. 
#Each of these series is 48 observations in length, from 2005 Q1 to 2016 Q4
#############################################################################
prison <- readr::read_csv("https://OTexts.com/fpp3/extrafiles/prison_population.csv")
prision <- prison %>% 
  mutate(Quarter = yearquarter(Date)) %>% 
  select(-Date) %>% 
  as_tsibble(key = c(State, Gender, Legal, Indigenous),
             index = Quarter)

#see 2.2 
melsyd_economy <- ansett %>% 
  filter(Airports == "MEL-SYD", Class == "Economy") %>% 
  mutate(Passengers = Passengers/1000)

#see 2.5
holidays <- tourism %>% 
  filter(Purpose == "Holiday") %>% 
  group_by(State) %>% 
  summarise(Trips = sum(Trips))

#see 2.6
visitors <- tourism |>
  group_by(State) |>
  summarise(Trips = sum(Trips))

#see 2.7
recent_production <- aus_production |>
  filter(year(Quarter) >= 2000)

#see 3.2
us_retail_employment <- us_employment |>
  filter(year(Month) >= 1990, Title == "Retail Trade") |>
  select(-Series_ID)

#see 5.1
gdppc <- global_economy |>
  mutate(GDP_per_capita = GDP / Population)

#see 7.3
recent_production <- aus_production |>
  filter(year(Quarter) >= 1992)

#see 8.1
algeria_economy <- global_economy |>
  filter(Country == "Algeria")

#see 8
aus_holidays <- tourism |>
  filter(Purpose == "Holiday") |>
  summarise(Trips = sum(Trips)/1e3)

#see 9.1
google_2015 <- gafa_stock |>
  filter(Symbol == "GOOG", year(Date) == 2015)

#see 9.9
h02 <- PBS |>
  filter(ATC2 == "H02") |>
  summarise(Cost = sum(Cost)/1e6)
