URL set up
Author: Yurock Heo

Set up Hosting

1. Install Firebase CLI:
Make sure you have Node.js installed. Then, install the Firebase CLI:
Terminal:
    npm install -g firebase-tools

2. Login to Firebase:
Terminal:
    firebase login

3. Go to the root directory of SPAI.

4. Initialize Firebase Hosting:
Terminal:
    firebase init

5. Build Flutter Web App:
Terminal:
    flutter build web


Verify Ownership of the Domain

1. Login and go to Dashboard by clicking the account icon left top and find Domain List.

2. Select "spaitest.com" and click Actions -> DNS/Host Records

3. Select Namecheap BasicDNS-> I want to update Host Records

4. Add the following records:

Record Type: A 
Host: spaitest.com
Value: 199.36.158.100

Record Type: TXT 
Host: spaitest.com
Value: hosting-site=spaidemo2

5. Remove the record below
Record Type: A 
Host: spaitest.com
Value: 199.188.205.245

These informations can be found in firebase console -> Hosting -> Manage site -> Domains -> Needs setup.


