# Structure

## Option 1

![](./TalkModel_Option1.png)

#### Patterns:
```
[
  {
    "type": "comment",
    "inferences": [
      {
        "related_ID_field": "author_id",
        "predicate": "authors",
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
        "predicate": "is_in_the_context_of",
        "direction": "in",
        "required": false
      },
      {
        "related_ID_field": "status_id",
        "predicate": "moderated_as",
        "direction": "in",
        "required": false
      },
      {
        "related_ID_field": "flag_id",
        "predicate": "flags",
        "direction": "out",
        "required": false
      }
    ]
  },
  {
    "type": "page",
    "inferences": [
      {
        "related_ID_field": "comment_id",
        "predicate": "is_in_the_context_of",
        "direction": "out",
        "required": false
      }
    ]
  },
  {
    "type": "user",
    "inferences": [
      {
        "related_ID_field": "comment_id",
        "predicate": "authors",
        "direction": "in",
        "required": false
      },
      {
        "related_ID_field": "flag_id",
        "predicate": "flags",
        "direction": "in",
        "required": false
      }
    ]
  },
  {
    "type": "flag",
    "inferences": [
      {
        "related_ID_field": "comment_id",
        "predicate": "is_flag_by",
        "direction": "out",
        "required": false
      },
      {
        "related_ID_field": "user_id",
        "predicate": "flags",
        "direction": "out",
        "required": false
      }
    ]
  },
  {
    "type": "status",
    "inferences": [
      {
        "related_ID_field": "comment_id",
        "predicate": "moderated_as",
        "direction": "out",
        "required": false
      },
      {
        "related_ID_field": "user_id",
        "predicate": "moderates",
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
    "predicate": "authors",
    "object_types": [
      "comment"
    ],
    "in_string": "authored",
    "out_string": "authored by"
  },
  {
    "subject_types": [
      "user"
    ],
    "predicate": "flags",
    "object_types": [
      "flag"
    ],
    "in_string": "flagged",
    "out_string": "flagged by"
  },
  {
    "subject_types": [
      "user"
    ],
    "predicate": "moderates",
    "object_types": [
      "status"
    ],
    "in_string": "moderated",
    "out_string": "moderated by"
  },
  {
    "subject_types": [
      "page"
    ],
    "predicate": "is_context_for",
    "object_types": [
      "comment"
    ],
    "in_string": "is context for",
    "out_string": "in the context of"
  },
  {
    "subject_types": [
      "comment"
    ],
    "predicate": "parent",
    "object_types": [
      "comment"
    ],
    "in_string": "parents",
    "out_string": "is the child of"
  },
  {
    "subject_types": [
      "comment"
    ],
    "predicate": "moderated_as",
    "object_types": [
      "status"
    ],
    "in_string": "is moderated as",
    "out_string": "moderates"
  },
  {
    "subject_types": [
      "comment"
    ],
    "predicate": "is_flag_by",
    "object_types": [
      "flag"
    ],
    "in_string": "is context for",
    "out_string": "in the context of"
  }
]
```

## Option 2

![](./TalkModel_Option2.png)
