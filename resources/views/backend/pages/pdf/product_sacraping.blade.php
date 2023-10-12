<!DOCTYPE html>

<html>

<head>

    <title>{{ $project['title'] }}</title>

</head>

<body>

    <h1>{{ $project['title'] }}</h1>

    <p>{!! nl2br($project['content']) !!}</p>
</body>

</html>