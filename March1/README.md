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
Every 100 frames, a random blob type will be selected from the arraylist of current surviving blobs. The new blob will have a random location and random size (in a certain range that makes sure it's small). Its max radius, max steering force, max speed, and type will be the same as the selected blob from the array list. This means it's more likely to spawn a type of blob when there are more of the same kind alive. 

# Problems
* Spawning idea
  * My original idea for blob regeneration was for a blob type to spawn whenever two blobs of the same kind collides. In the end, I wasn't able to figure out a clear logic for this idea. The main error I ran into was the concurrent modification error. 
* Same type collision
  * My idea for same type blob interactions were also different at the start. I intended for these collisions to simply cause each blob two bounce away. After this, I wanted my original spawning idea (point above) to happen. I the bouncing collision happen. However, an issue came up when implementing my original spawning idea. Specifically, the function detects when two blobs are a certain distance, and same color blobs would spawn under this condition. However, multiple frames would pass while two same type blobs collide, causing an endless amount of that blob to spawn. 
  * When I changed my spawning idea to random blob regeneration on the map, a bug would appear if I stayed with the original collision method. The program bugged whenever a blob spawn on top of another same type blob. This is why I decided to change the same type interactions to passing by. 
 * Image issues
  * My final main issue is related to image enhancements of the simulation. Currently, I have images of three types of blobs and a background. I also wanted to have a sad face image on any blob that reached its max radius. This was because I felt it was a bit hard to know for certain which blob had reached its max. I loaded the image and wrote out the if statements in the display function for the blobs, but the sad faces never showed when intended. I suspect this might be a layering issue. 

# Simplifications
Most of my simplifications are listed in the problems section above. There are two other main ones that I did not have time to attempt. The first one was to have another DNA strand that determined the consumption efficiency for a blob. Currently, a blob fully absorbs another when there is a collision. I don't think this is how consumption and energy transfer works in real life, so I wanted to limit this efficiency for blobs. Another simplifications was values that were dependant on the size of the blob. For example, a blob would move slower if it were bigger. 
