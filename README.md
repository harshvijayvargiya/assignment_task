# Description

## Remaining functionality
	Configure another application to prevent apart from CSRF token.

## Which type of problem i’ve faced during the implementation
	For security prevention I have applied only protect_from_forgery, I have to try a few ways but not get success.
	Also, I have faced some trouble with fetching players for the scoreboard.


# Things you may want to cover:

## Clone the repository
	git clone https://github.com/harshvijayvargiya/assignment_task.git

## Application version dependencies
	Ruby 2.5.0p0
	Rails 5.0.7.2
	PostgreSQL

## Steps that needs to be executed before running application

	bundle install
	set database file
	rails db:create db:migrate db:seed

## Database initialization
	rails s

## Follow steps:
	1. Add new player.
	2. Add new game.
		When we create a new game then after creating a game, scores will be created for random players and for those players scoreboard will be updated.
		Check Score Board and Game Score tab for analysis.
