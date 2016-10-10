# Structure

![](./TalkModel_Option1.png)

#### Patterns:
```
[
  {
    "type": "comment",
    "inferences": [
      {
        "related_ID_field": "author_id",
        "predicate": "author",
        "direction": "out",
        "required": false
      },
      {
        "related_ID_field": "parent_id",
        "predicate": "parent",
        "direction": "out",
        "required": false
      },
      {
        "related_ID_field": "context_id",
        "predicate": "context",
        "direction": "in",
        "required": false
      },
      {
        "related_ID_field": "status_id",
        "predicate": "has",
        "direction": "in",
        "required": false
      }
    ]
  },
  {
    "type": "page",
    "inferences": [
      {
        "related_ID_field": "comment_id",
        "predicate": "context",
        "direction": "out",
        "required": false
      }
    ]
  }
]
```

#### Relationships:
```
[
  {
    "subject_types": [
      "user"
    ],
    "predicate": "author",
    "object_types": [
      "comment"
    ],
    "in_string": "authored",
    "out_string": "authored by"
  },
  {
    "subject_types": [
      "comment"
    ],
    "predicate": "context",
    "object_types": [
      "page"
    ],
    "in_string": "in context of",
    "out_string": "is context for"
  }
]
```
