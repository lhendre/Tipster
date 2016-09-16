# Tipster
gif walkthrough: http://imgur.com/Tpl93pw

This App allows the user to quickly calculate their own tip with a customizable bill, tip, and number of people.  
The first screen is simply a title screen, after the user clicks through that they are invited to the main screen.  
They tap then type in the amount they needed to pay, their is a scroll bar to determine the tip percentage, and a segmented display to determine how many people there are.  
Currently the scroll bar for the tip precentage is loaded with 0 if there is no default, else it is loaded with the default which is set in the settings page, and if the default is below 40 I limit the person to a 40% max tip, else I double the amount of the default to determine the max(with the min being zero).  If time allows I plan on making this more customizable.
The segmented display is currently locked in for 4 customers, planning on increasing this/ making it customizable.
Amoung those views I also display the total for what you have chosen and what it would look like with more people based on simple math that is triggered whenever there is a change.
There is a small animation when the keyboard comes up as I edit the view to make it cleaner.
If some ones selects the settings button on the navbar they are taken to the settings screen.  While there they can currently add in a default tip percentage which will be stored whenever you leave page and the main page will load it in whenever it is viewed.
Given time I plan on saving the max and min tip amount, potential customers and customizing your background.  
Currently I added in an image to form the background to the app.
You may change the region of your phone and it will also change the currency displayed.
