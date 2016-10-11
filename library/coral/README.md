# Queries Available

## All Comments on a Page

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

## All Comments on a Comment

```
/v1/exec/all/view/comment_thread/:comment_id
```

* View "comment_thread"
* Query "all"

*Example: ```curl -X GET http://127.0.0.1:16180/v1/exec/all/view/comment_thread/44```*

## Item Counts all the comments on a Page

User Case: [As a reader, I can see how many comments there are so that I can gauge activity in a comment thread.](https://www.pivotaltracker.com/n/projects/1863625/stories/130309983)

```
/v1/exec/count/view/comment_stream/:context_id
```

or

```
POST /v1/exec/view/comment_stream/:context_id
```
with the query 'count' in the body.

* View "comment_stream"
* Query Set "count"

*Example: ```curl -X GET 127.0.0.1:16180/v1/exec/count/view/comments_stream/22```*

## Get a single item and all related items

*To Do. Block by https://github.com/coralproject/shelf/issues/245*

User Case: [As a reader, I want to view a permalink for the comment so that I can easily reference that comment.](https://www.pivotaltracker.com/n/projects/1863625/stories/130310029)

```
/v1/exec/comment/:comment_id
```

* Query "Comment"
