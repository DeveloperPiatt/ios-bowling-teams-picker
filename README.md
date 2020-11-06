# ios-bowling-teams-picker
A simple app for tracking scores and teams for our saturday bowling

# Rules
#### # of Players: 4+
#### How it works: 
1. Bowlers all bowl until they have a 4th frame score recorded. 
    1. In the case of a tie, there is a Tiebreaker field to use.
    1. If Bowler A and Bowler B each strike through the first 6 frames, they would have 120 recorded in the 4th frame. So we record that and keep bowling until Bowler A and Bowler B are no longer tied. Whenever these scores are no longer tied, we record their scores at that time and the app will use the Tiebreaker score to determine who is scoring higher.
    1. The Tiebreaker score will not conflict with anything else. It'll ONLY be used to settle ties, and will only be required for bowlers who have a 4th frame tie with another bowler.
1. As bowlers finish their game, record their final score.
1. Once all final scores are recorded, the show teams button can be used to see who won.
