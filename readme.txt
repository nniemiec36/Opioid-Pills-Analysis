For each load file, one row was rejected and not loaded into the data table. This was likely the header rows (row 1) in each CSV.

q3a: For this question, I first selected all rows in which the buyer county = 'Suffolk', then created a value that combined the total dosage and date of dosage, and from there, I created another version in which I took the sum of all dosages in that month. Next, I selected the normal dosages, then the average (smoothed) version, and finally the date and graphed the results.

q3b: For this question, I first selected the zip code and sum of all MME and grouped by zip code. From here, I selected the the zip code, the sum of MME divided by the zipcode's population as a normalization of the value, and its descending ranking. In order to do this, I also did an inner join on buyer zip codes from DEA_NY and ZIPPOP and chose the top 10 rankings. 

