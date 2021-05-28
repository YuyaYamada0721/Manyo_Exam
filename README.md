|users||
|:-|-:|
|id|
|user_name|string|
|user_email|string|
|password_digest|string|

|tasks||
|:-|-:|
|id<br>user_id(FK)<br>label_id(FK)|
|task_name|string|
|task_content|text|
|expiration_deadline|date|
|status|string|
|priority|integer|

|labels||
|:-|-:|
|id|
|label_name|string|
