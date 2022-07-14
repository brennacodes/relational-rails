# Wetective
_____

Wetective is a database of investigational departments and the cases that they investigate. 

![Database Schema](https://user-images.githubusercontent.com/98294995/178849248-5196d730-999c-4c61-850a-3055514d14e8.png)

In it's current state it:
- uses Bootstrap for a clean, responsive UI
- can search departments based on varaious data points connected to that department
- can narrow a department's investigations based on an input number of leads
- uses helper methods, modules, and partials for forms and search bar implementation
- can sort each data table by any attribute (ex. by name, address, etc in either ascending or descending order)
- notes which column is the current column being sorted, and in what direction

Difficulties:
Were mostly in testing. 
- Strange behavior with capybara testing route redirects upon form submission (the localhost site does not have this issue)
- Capybara not recognizing some update or creation of datatabase objects
- Figuring out how to test an `application_helper` module method
- Learning a few new Rails "reserved words" after having to rename a ton of stuff early on... like "case" 🥹

**Short term goal**: to use the FBI Most Wanted api to populate ongoing open investigations that are seeking information from the public.  
**Medium term goal**: to build out an api that can be used by departments to populate the Wetective database, and to receive tips from users.  
**Long term goal**: to implement a consumer-focused UX, with a "swipe-to-view-next" interface, and context filtering for both investigations that are shown to a user (ex. based on user proximity to investigation area), as well as for tips that are sent to the platform from users (ex. using NLP to filter out spam or low-quality submissions). 

_____
# Screenshots

<img width="1004" alt="Screen Shot 2022-07-13 at 5 05 45 PM" src="https://user-images.githubusercontent.com/98294995/179023395-b16df3b3-581a-43ee-96d4-a58b37fb2114.png">
<img width="1112" alt="Screen Shot 2022-07-13 at 7 22 16 PM" src="https://user-images.githubusercontent.com/98294995/179023447-a264dff1-eda3-4111-b609-c23e64fa18d6.png">
<img width="1111" alt="Screen Shot 2022-07-13 at 7 21 59 PM" src="https://user-images.githubusercontent.com/98294995/179023501-b880dbee-5f97-42ad-86c7-66f40f233d59.png">

