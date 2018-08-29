quick and dirty calculation of a rating of a weeks nfl games by weighting different factors of an nfl game. (total yards, total points, absolute diff of score etc. ) Highest rating supposed to be the best.

# build
docker build -t nflrating
# run
docker run -it --rm --name nflrating.py nflrating

# p.s.
docker run only calculates with available data, so at least once a week running docker build to fetch latest data is required. 

only data from 2018 season is fetched. modify dockerfile to fetch data from previous seasons. 