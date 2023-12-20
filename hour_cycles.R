# https://stats.stackexchange.com/questions/245866/is-hour-of-day-a-categorical-variable
# https://stats.stackexchange.com/questions/148380/use-of-circular-predictors-in-linear-regression
hr <- c(0:23)
xhr <- sin(2*pi*hr/24)
yhr <- cos(2*pi*hr/24)

plot(xhr)
lines(yhr, col=2) # cosine
# circle
plot(xhr, yhr)

# Can see hour 23 similiar to hour 24
plot(hr, xhr + yhr)
# see approx centre of each interval
# probably don't need to do this for hours - maybe more for months, where each month is different length
plot(hr, sin(2*pi*(hr-0.5)/24) + cos(2*pi*(hr-0.5)/24))

# radians
plot(hr, 2*pi*hr/24)

# Convert minute into fraction of an hour
# Otherwise you'll see gap from 59th minute to next 0 minute if you keep time as e.g. 1259/1440
min <- c(0:59)/60
hr_min <- expand.grid(hr, min) %>% mutate(hr_min = Var1 + Var2) %>% pluck("hr_min") %>% sort()
plot(hr_min, sin(2*pi*hr_min/24) + cos(2*pi*hr_min/24))
