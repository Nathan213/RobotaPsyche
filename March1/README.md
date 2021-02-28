# Decisions
One of themain decisions I made was to over turn my previous code's theme, which was a rocket in space. I felt like the evolution concept didn't fit that well. Instead, I re-wrote my code where germs called "blobs" fight for survival. 

While my previous code used flowfields for the rocket to move (as well as arrow keys), I thought a flow field wouldn't fit how germs move. Afterall, they don't follow the same path. So, I decided to do the wandering mechanism from exercise 6.12 in the nature of code. Each blob has a small circle a certain distance in front of it. A dot moves along the circumference of this circle randomly every frame, which is the blob's target. 

# DNA
For the DNA of the blobs, I have:
* blob radius
* blob maximum radius
* blob maximum steering force
* blob maximum speed
* blob type (red, green, blue)

# System Criterion
## Survival
A blob can survive as long as there are no interactions with any other blobs. 

## Removal
When two blobs of different color collide, the blob with the smaller radius will die. The blob with the bigger radius will gain the dead one's radius. Same color blobs will just float pass each other. A blob can eat as many different color blobs as it wants, until it reaches its maximum radius. If a blob that's at max radius collides with a smaller blob, it will die from over eating. Two blobs of the same radius will both die upon collision. 

## Regeneration
Every 100 frames, 

# Problems

# Simplifications
