Assuming the `load.sh` script has been executed, the following querys and views should be available.

# Named Queries

## `all` 

```
{
    "name": "all",
    "pre_script": "",
    "pst_script": "",
    "params": [],
    "queries": [
      {
        "name": "all",
        "type": "pipeline",
        "collection": "view",
        "commands": [
            {"$skip": 0}
        ],
        "indexes": [],
        "return": true
      }
    ],
    "enabled": true,
    "explain": false
}
```

This named query returns all items in a view.

## `count-view`

```
{
    "name": "count-view",
    "pre_script": "",
    "pst_script": "",
    "params": [],
    "queries": [
      {
        "name": "count",
        "type": "pipeline",
        "collection": "view",
        "commands": [
             { "$group": { "_id": null, "count": { "$sum": 1 } } }
        ],
        "indexes": [],
        "return": true
      }
    ],
    "enabled": true,
    "explain": false
}
```

This named query provides a count of items in a view.

## `moderator-queue`

```
{
    "name": "moderator-queue",
    "pre_script": "",
    "pst_script": "",
    "params": [],
    "queries": [
      {
        "name": "stream_comments",
        "type": "pipeline",
        "collection": "view",
        "commands": [
            {"$match": {"$or": [{"item_id": "#string:comment_id"}, {"type": "comment"}]}},
            {"$match": {"$and": [{"status": "untouched"}, {"flagged_by": {"$exists": true}}]}}
        ],
        "indexes": [],
        "return": true
      }
    ],
    "enabled": true,
    "explain": false
}
```

# Views

## `comment_stream`

```
{
  "name": "comment_stream",
  "collection": "items",
  "start_type": "asset",
  "return_root": true,
  "paths": [
    {
      "strict_path": false,
      "path_segments": [
        {
          "level": 1,
          "direction": "in",
          "predicate": "in_the_context_of",
          "tag": "comment"
        },
        {
          "level": 2,
          "direction": "in",
          "predicate": "parented_by",
          "tag": "child"
        }
      ]
    }
  ]
}
```

The `comment_stream` view includes all the items of type `comment` that are `in_the_context_of` of an item of type `asset`.  In addition, the view includes all other items that are of type `comment` and are `parented_by` comments `in_the_conetxt_of` an item of type `asset`. The view also includes the root item of type `asset`.

For example, to return all the items in a `comment_stream` view, use:

```
GET /v1/exec/all/view/comment_stream/:asset_id
```

where `asset_id` is the `item_id` of the item of type `asset` on which you intend to start the view.  Alternatively, you could provide a custom query via:

```
POST /v1/exec/view/comment_stream/:asset_id
```

## `comment_thread`

```
{
	"name": "comment_thread",
	"collection": "items",
	"start_type": "comment",
	"return_root": true,
	"paths": [
		{
			"strict_path": false,
			"path_segments": [
				{
					"level": 1,
					"direction": "in",
					"predicate": "parented_by",
					"tag": "child"
				},
				{
					"level": 2,
					"direction": "in",
					"predicate": "authored",
					"tag": "author"
				}
			]
		},
		{
			"strict_path": false,
			"path_segments": [
				{
					"level": 1,
					"direction": "in",
					"predicate": "parented_by",
					"tag": "child"
				},
				{
					"level": 2,
					"direction": "in",
					"predicate": "parented_by",
					"tag": "grandchild"
				},
				{
					"level": 3,
					"direction": "in",
					"predicate": "authored",
					"tag": "author"
				}
			]
		},
		{
			"strict_path": false,
			"path_segments": [
				{
					"level": 1,
					"direction": "in",
					"predicate": "authored",
					"tag": "author"
				}
			]
		},
		{
			"strict_path": false,
			"path_segments": [
				{
					"level": 1,
					"direction": "out",
					"predicate": "in_the_context_of",
					"tag": "asset"
				}
			]
		}
	]
}
```

The `comment_thread` view includes all the items "surrounding" a certain item of type `comment`.  These include: 
- other items of type `comment` `parented_by` the staring item of type `comment` (along with an item of type `user` that `authored` the child comment), 
- an item of type `asset` for which the starting item is `in_the_context_of`, 
- an item of type `user` that `authored` the starting item of type `comment`, 
- and grandchildren of the starting item of type `comment` (along with the corresponding `user` that `authored` the grandchild comments).  

The view also returns the root item of type `comment`.  

For example, to return all the items in a `comment_thread` view, use:

```
GET /v1/exec/all/view/comment_thread/:comment_id
```

where `comment_id` is the `item_id` of the item of type `comment` on which you intend to start the view.  Alternatively, you could provide a custom query via:

```
POST /v1/exec/view/comment_stream/:comment_id
```
