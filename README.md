# BugSmash :space_invader:

### Overview & About
 BugSmash Is An End User Friendly Bug Reporting Interface For Swift, BugSmash Is Easy To Use & Even Eaiser To Impliment. All   Data Entered Into BugSmash Is Saved Into A SQL Database For Easy Retrieval.

#### Report Data Collected By BugSmash:
 * ID 
 * Submission Timestamp
 * Report Status
 * Reportees First Name
 * Reportees Email
 * Subject
 * Details
 * Device Model
 * Device OS Version
 * App Name
 * App Version
 * Build Number 
 * Device IP
 This Is Just An Example Of The Data That Can Be Collected, The Opportunites Are Endless.

### Implimentation & Setup

#### Requirements:
 * Xcode
 * A Web Server (PHP Enabled)
 * A MySQL Database
 * 15 Minutes
 
#### Step 1 - Database Setup
 Open Terminal & Run:
 ```
 curl -s 'https://BugSmash.webstax.io/database.sql' | mysql -u root -p
 ```
 You Will Be Prompted For A Password, The Password Is Your Root Password For MySQL.

#### Step 2 - Setup Database User
Then Run:
 ```
 curl -s 'https://BugSmash.webstax.io/user.sql' | mysql -u root -p
 ```
 You Will Be Prompted For Your MySQL Password Again.
 
 #### Step 3 - Download Upload Service.
Then Run:
 ```
 /var/www/example.com | wget https://BugSmash.webstax.io/services.php
 ```
 Replace "Example.com" With Your Your Domain Name.
