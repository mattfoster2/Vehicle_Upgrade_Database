# Vehicle Upgrade Database


### Matt Foster
### MSSA CAD
### Dec 2020

#

[Database Diagram](Vehicle_Upgrade_Database_Diagram.pdf)  

I opted to go with the idea of a vehicle parts database out of personal experience over the past ten years working on cars and performing modifications.  One of the things I always end up forgetting over time is “did I replace that already?” or “when does the warranty on that expire?”, or maybe a question I hate to ask myself, which is “how much money have I spent on this car”.  Even performing the modifications yourself, the parts themselves can add up quickly, but this database would be able to tell you how much you have invested in it, what still needs upgraded, when warranties on various parts expire, and whatever other information the user would like to input.  I want to make this a one stop shop for documenting the investment and durability of a owner’s vehicle or vehicles.  

Originally, I wanted this website to have click functionality on a picture diagram based on the type of vehicle that is selected, and the region (ie, front suspension, rear suspension, engine bay), but that may be difficult to accomplish in 18 weeks.  I would at least like to have color coded text boxes broken down in a sort of tree diagram that show the various components.  For example, when a user inputs a Jeep and selects track bar suspension, going into the tree for “front suspension” would bring more tiles like “tie rod”, “drag link”, “track bar”, “sway bar”, “sway bar end links”, “struts”, “coil springs”, “bump stops”, “steering box”, “ball joints”, “wheel bearings”, “brake rotors”, “brake pads”, “u joints”, “lower control arms”, “upper control arms”, and anything else I’m currently forgetting.  Going into each of these tiles would give the option for the user to input the date the upgrade was completed, select between OEM replacement or upgrade, the purchase location, price, warranty expiration date, and labor charges if any apply.  They could also upload a purchase receipt if desired, and perhaps a photograph of the upgrade.  

Think of this website as a documents folder, which has categorized branches to help locate what you’re looking for.  I would like the user to be able to easily see what needs looked at based on the mileage input at the vehicle input selection.  At 60,000 miles, the tiles would go from green to yellow to indicate an inspection, at 100,000 it would indicate orange for service, and 150,000 would show red to replace until the user indicates that it is serviceable and inspected. 
This will have the ability for users to create an account with a password to sign into and store vehicles input into the database.  It will store the users name, email address, and any vehicles tied to it.  

In terms of the types of information that will be stored, it will mostly be string text data.  The area for price of the component and labor will be stored as a decimal value that will be used in a calculation to show the price invested into the vehicle.  At some point down the line, it would be cool to integrate this with a service like Kelly Blue Book, that would show the value of the vehicle vs investment.  I believe that this will be a useful tool for anyone looking to track their vehicle’s health and keep accurate records of services and maintenance over time.  It is not something I have really seen in my searches online.  
