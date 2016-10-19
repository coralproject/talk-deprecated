# Product's Terminology

This is a guide to have a common language to talk about "Talk".

## Definitions

* Site - a top level site, aka nytimes.com
* Section - the section of a site, aka, Politics
* Page/Asset? - An article/video/or other ‘page’ of a site identified by URL.
* Journalist - Person who wrote the article/page/etc...
* Coral Space? - Everything we put on a page: comment box, ToS, Stream, etc…
* Stream - All the activity on a certain page/asset. Container for Comments, actions, user
* Thread - defined by a parent and everything below. All replies to a comment and their replies, etc…
* Comment - a kind of user-generated content submitted by a comment author
  * A parent comment has replies to it
  * A child comments is a reply to another comment
  * A comment can be both a parent comment and a child of another comment
  * A top-level comment is a comment that is not a reply to any other comment
  * A nth-level comment refers to the number of replies away from the top-level comment

* User - an item to represent a person using Talk. It could be a moderator, reader, etc.
* User Roles:
  * Active: some who takes action (logged in or not)
  * Passive: some who just reads, no actions performed
  * Comment Author: The user who wrote the comment
  * Staff Member: someone who works for an organization (tagged for leverage in trust)
  * Moderator: someone with the ability to access the moderation queue and perform moderation actions
  * Administrator: has the ability to change the setup of their coral space
* Public Profile: information about users shown in public
* Private Profile: information about users shown only to user about themselves
* Protected Profile: information about users that only moderators and admins can see

* Queue - Group of items based on a query, aka - moderation queue
* Target - The item/s on which an action is performed..

## Item Types

* Site
* Section
* Page/Asset
* User
* Comment

##  Actions

Actions are a special class of items. They are performed by items (aka, users) on items. Actions themselves are items. This requires two relationships: action on item, and user performs action.

### Flag
* A Flagger(user) performs a Flag
* A Flag is performed on a Comment or a username or profile content

### Like
* A user performs a Like
* A Like is on a Comment

### Moderate
* A user performs a Moderation Action with a Value (aka, accepted, rejected, etc…, default ‘untouched’)
* A Moderations is performed on a Comment

### Follow
### Mute

## Relationships

The key for a relationship is a predicate.  Relationships also have _in_string_ and _out_string_ that are used when describing the in and out relationships in language.

Predicate: context
In: A Comment is in_context_of a Page
Out: A Page is_context_for Comments

Predicate: author
In: A User authored a Comment
Out: A Comment is authored_by a User

Predicate: parent
In: A Comment is parented_by a Comment
Out: a Comment is parent_of a Comment

Predicate: flag (User -> Action)
In: A User creates a Flag
Out: A Flag is created_by a User

Predicate: flags (the Action -> Item)
In: A Flag flags a comment
Out: A Comment is flagged by a Flag

## Patterns

### Type “Comment”
* User author_id authored Comment
* Comment parent by Comment parent_id
* Comment in context of Page context_id

### Type “Flag”
* Flag created by User user_id
* Item item_id has a Flag

### Views

* Thread

### Query Sets

* Count
* Basic Thread
