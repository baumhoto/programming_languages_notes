import nflgame
from math import fabs
from operator import itemgetter, attrgetter, methodcaller

year = raw_input("Year: ")
week = raw_input("Week: ")
kind = raw_input("Kind (PRE/REG/POST): ")

games = nflgame.games(int(year), week=int(week), kind=kind)
#filtered_games = filter(lambda x: x.away == "CAR", games)
filtered_games = games

for g in filtered_games:
    g.totalScore = (g.score_home + g.score_away)
    g.scoreDiff = fabs(g.score_home - g.score_away)
    g.totalYards = g.stats_home.total_yds + g.stats_away.total_yds
    g.totalTurnovers = g.stats_home.turnovers + g.stats_away.turnovers
    g.totalFirstDowns = g.stats_home.first_downs + g.stats_away.first_downs
    g.totalScoringAttempts = 0
    g.totalPosessionLosts = 0
    g.drivesCount = 0
    for d in g.drives:
        g.drivesCount += 1
        if d.result == "Touchdown" or d.result == "Field Goal" or d.result == "Missed FG":
            g.totalScoringAttempts += 1
        elif d.result == "Interception" or d.result == "Fumble":
            g.totalPosessionLosts += 1
    g.overallRating = (g.totalScore /g.totalScoringAttempts) + (g.totalYards/g.drivesCount) + g.totalScoringAttempts + g.totalPosessionLosts + (8 - g.scoreDiff)

print "AWAY\tHOME\tOVR"
for g in sorted(filtered_games,key=attrgetter('overallRating')):
    print g.away + "\t" + g.home + "\t" + str(g.overallRating)