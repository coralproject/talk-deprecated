# Queries Available

## A Comment Stream

A stream is a all the items related to a page:

* comments and its author

```
GET /v1/exec/all/view/comment_stream/:context_id
```

or

```
POST /v1/exec/view/comment_stream/:context_id
```
with the query 'all' in the body.

* View "comment_stream"
* Query "all"

*Example: ```curl -X GET 127.0.0.1:16180/v1/exec/all/view/comments_stream/22```*

## A Comment Thread

A thread is a single comment and:

* author
* context (page)
* children
* children's authors


```
/v1/exec/all/view/comment_thread/:comment_id
```

* View "comment_thread"
* Query "all"

*Example: ```curl -X GET http://127.0.0.1:16180/v1/exec/all/view/comment_thread/44```*

User Case: [As a reader, I want to view a permalink for the comment so that I can easily reference that comment.](https://www.pivotaltracker.com/n/projects/1863625/stories/130310029)

## Item Counts all the comments on a Page

In this case we use the query 'count-view' to count items on the view 'comment_stream'
```
/v1/exec/count-view/view/comment_stream/:context_id
```

or

```
POST /v1/exec/view/comment_stream/:context_id
```
with the query 'count-view' in the body.

* View "comment_stream"
* Query Set "count"

*Example: ```curl -X GET 127.0.0.1:16180/v1/exec/count-view/view/comments_stream/22```*

User Case: [As a reader, I can see how many comments there are so that I can gauge activity in a comment thread.](https://www.pivotaltracker.com/n/projects/1863625/stories/130309983)


## Action on a Comment by a User

Action could be:

* flagged_by
* liked_by

```
POST /v1/action/:action/user/:user_id/on/item/:comment_id
```

```
DELETE /v1/action/:action/user/:user_id/on/item/:comment_id
```

User Case: [.](https://www.pivotaltracker.com/...)
