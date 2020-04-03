CREATE USER 'BugSmash'@'localhost' IDENTIFIED BY 'BugsAreGettingSmashed';
GRANT ALL PRIVILEGES ON BugReporter.BugReporter TO 'BugSmash'@'localhost';
FLUSH PRIVILEGES;
