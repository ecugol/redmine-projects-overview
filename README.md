# Projects Overview

## Installation

From Redmine installation directory:

Run
```
mkdir plugins/projects_overview wget -qO - https://github.com/ecugol/redmine-projects-overview/archive/main.zip | tar jx --strip-components=1 -C plugins/projects_overview
```
Or
```
git clone git@github.com:ecugol/redmine-projects-overview.git plugins/projects_overview
```
And restart web server

## Configuration

1) Create groups, containing "Team" in their names, i.e. "John's Team"
2) Add users to groups
3) Check the overview page at https://yourinstallation.com/overview

