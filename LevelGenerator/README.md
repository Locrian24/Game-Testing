Generates a level made out of 8 randomly selected templates, with some rules that are still to be finalised. There is the assumption each section is 512x288, therefore the generated room must be 1024x1152 to fit all chosen sections in a 2x4 grid, changing these values also involves changing the dimensions of the encoded templates which can be done in the LevelEditor project

***IMPORTANT:*** For the templates to be loaded, the encoded template created by the Level Editor will have to be copy and pasted into the **simple.json** file in the *datafiles* folder from the specific text file the encoded template string was saved. It must be placed within the "templates" array of the correct room type section (i.e. simple, store, puzzle, etc.). Please look at how JSON is structured if you're unsure how to do this.

**RULES:**

*Rule 1*: There is a 50% chance a level will have a store
*Rule 2*: 80% chance each section will be a simple section with some obstacles

**NOTES:**

- The room in GameMaker must contain the oGenerateLevel object (which calls the scrCreateLevel script on Create)
