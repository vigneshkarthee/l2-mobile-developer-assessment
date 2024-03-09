# Pop-The-Balloon Mobile Video Game

## Objective

Create a mobile based video game which asks the players to pop the greatest number of balloons within a time period of 2 minutes. The game must contain the following elements:

1) A timer, which decrements from 02:00 at the beginning of the game to 00:00 at the end of the game.
   
2) A scorecard, which measures the number of balloons popped during the time duration
   
3) Arbitrary number of balloons, which randomly appear from the bottom of the screen and flow towards the top of the screen and disappear. Player receives +2 for popping the balloon while it is visible, and a penalty of -1 for every balloon missed.

## Requirements

1)	Interface Design
   
    a)	Clean and Intuitive Layout: Prioritize a focus on the core gameplay elements (timer, scorecard, and balloons).

    b)	Simple, unobtrusive start screen with game title and a "Start" button.

    c)	Show Timer with prominent font and display size. 

    d)	Scorecard should be contrasting with colors separating the "balloons popped" and "balloons missed" counts.

    e)	Use bright, vibrant colors for balloons, ensuring a distinct appearance against the background.

    f)	End screen that displays the final score, perhaps with options to "Play Again"

2)	Game Logic

    a)	Implement a timer that accurately decrements from 2:00 to 0:00, with one-second intervals.

    b)	Track balloons popped (+2 points) and balloons missed (-1 point). Ensure an accurate final score calculation on game completion.

    c)	Randomly generate balloons at the bottom of the screen in random horizontal positions across the screen at varying intervals. Control the movement speed of balloons - they should be slow enough for players to tap, increasing moderately as gameplay progresses. 

    d)	Detect collisions between players' taps and balloons. Consider adding a visual effect upon successful popping (like a small burst or splash).

3)	User Interaction & Responsiveness

    a)	Simple Tap-to-Pop: The primary interaction should be a simple tap on a balloon to pop it

    b)	Responsive Touch Controls: Ensure immediate and accurate registration of taps, providing instant feedback to the player.

## Deliverables

1) Functional Prototype: A basic working game that demonstrates the core mechanics (timer, score calculation, balloon generation/movement, and tap-to-pop interaction).
   
2) A demo video recording of the functioning game accessible via browser.
   
3) Source code with comments explaining the logic and structure for future reference or modifications.

## Constraints:

1) Development Platform: Use Flutter /React Native for cross platform game development in iOS/Android
 
2) Ensure compatibility with major mobile OS platforms.
