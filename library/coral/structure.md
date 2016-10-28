# Structure

(figure needs to be updated, but the below listing of metadata is up-to-date)
![](./TalkModel_Option1.png)

#### Patterns:
```
{
	"type": "comment",
	"inferences": [
		{
			"related_ID_field": "author_id",
			"predicate": "authored",
			"direction": "in",
			"required": false
		},
		{
			"related_ID_field": "parent_id",
			"predicate": "parented_by",
			"direction": "out",
			"required": false
		},
		{
			"related_ID_field": "asset_id",
			"predicate": "in_the_context_of",
			"direction": "out",
			"required": true
		},
		{
			"related_ID_field": "flag",
			"predicate": "flagged",
			"direction": "in",
			"required": false
		},
		{
			"related_ID_field": "status",
			"predicate": "has_status",
			"direction": "out",
			"required": false
		}
	]
}
```

#### Relationships:
```
{
	"subject_types": [
		"user"
	],
	"predicate": "authored",
	"object_types": [
		"comment"
	],
	"in_string": "authored by",
	"out_string": "authored"
}

{
	"subject_types": [
		"comment"
	],
	"predicate": "in_the_context_of",
	"object_types": [
		"asset"
	],
	"in_string": "in context of",
	"out_string": "is context for"
}

{
	"subject_types": [
		"user"
	],
	"predicate": "flagged",
	"object_types": [
		"comment"
	],
	"in_string": "flagged by",
	"out_string": "flagged"
}

{
	"subject_types": [
		"comment"
	],
	"predicate": "parented_by",
	"object_types": [
		"comment"
	],
	"in_string": "parents",
	"out_string": "is the child of"
}

{
	"subject_types": [
		"comment"
	],
	"predicate": "has_status",
	"object_types": [
		"status"
	],
	"in_string": "provides status for",
	"out_string": "has status"
}
```
