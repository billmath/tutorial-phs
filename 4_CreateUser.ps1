# Declare variables
$Givenname = "Allie"
$Surname = "McCray"
$Displayname = "Allie McCray"
$Password = "Pass1w0rd"
$Identity = "CN=Allie McCray,CN=Users,DC=contoso,DC=com"


# Create the user
New-ADUser -GivenName $Givenname -Surname $Surname -DisplayName $Displayname -AccountPassword $Password

# Set the password to never expire
Set-ADUser -Identity $Identity -PasswordNeverExpires $true