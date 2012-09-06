<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Torrent >> Magnet</title>
    <meta name="description" content="Torrent to Magnet online converter">
    <meta name="author" content="Zhao Zhou">
    <link rel="stylesheet" href="static/stylesheets/reset.css">
    <link rel="stylesheet" href="static/stylesheets/styles.css">
    <link href='http://fonts.googleapis.com/css?family=Squada+One' rel='stylesheet' type='text/css'>
    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="static/javascripts/spin.min.js"></script>
    <script src="static/javascripts/jquery.spin.js"></script>
    <style>
        .file-wrapper {
            cursor: pointer;
            display: inline-block;
            overflow: hidden;
            position: relative;
            margin: 50px 0 100px 0;
        }
        .file-wrapper input {
            cursor: pointer;
            font-size: 200px;
            height: 100%;
            filter: alpha(opacity=1);
            -moz-opacity: 0.01;
            opacity: 0.01;
            position: absolute;
            right: 0;
            top: 0;
        }
        input[type="file"]::-webkit-file-upload-button {
            cursor:pointer;
        }
        .file-wrapper .button {
            background: #7BD380;
            border: 5px solid #7BD380;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            color: #fff;
            cursor: pointer;
            display: inline-block;
            font-family: 'Squada One', cursive, sans-serif;
            font-size: 50px;
            font-weight: bold;
            /*margin-right: 5px;*/
            padding: 4px 18px;
            text-transform: uppercase;
            width: 850px;
        }
        .file-holder {
            margin: 50px 0 100px 0;
        }
    </style>

</head>
<body>
<script>
    var SITE = SITE || {};

    SITE.fileInputs = function() {
        var $this = $(this),
                $val = $this.val(),
                valArray = $val.split('\\'),
                newVal = valArray[valArray.length-1],
                $button = $this.siblings('.button'),
                $fakeFile = $this.siblings('.file-holder');
        if(newVal !== '') {
            //$button.text('Selected .torrent');
            //$button.text(newVal);
            /*if($fakeFile.length === 0) {
             $('#torrent_form').before('<span class="file-holder">' + newVal + '</span>');
             } else {
             $fakeFile.text(newVal);
             }*/
            $button.remove();
            $('#wrap').fadeTo('slow', 0.1);
            //$('body').spin("large", "black");
            $('body').spin({
                lines: 5, // The number of lines to draw
                length: 30, // The length of each line
                width: 20, // The line thickness
                radius: 40, // The radius of the inner circle
                rotate: 0, // The rotation offset
                color: '#7BD380', // #rgb or #rrggbb
                speed: 0.5, // Rounds per second
                trail: 100, // Afterglow percentage
                top: 250,
                left: 'auto',
            });
            $('#torrent_form').submit();
        }
    };

    $(document).ready(function() {
        $('.file-wrapper input[type=file]').bind('change focus click', SITE.fileInputs);
    });
</script>
<div id="wrap">
    <div id="content">
        <a href="/">
            <img style="margin-bottom: 100px;" src="/static/media/torrent.png" />
        </a>
        <a href="/">
            <img style="margin-bottom: 100px;" src="/static/media/arrow.png" />
        </a>
        <a href="/">
            <img style="margin-bottom: 100px;" src="/static/media/magnet.png" />
        </a>
        <p id="success"><a href="{{ link }}">{{ link }}</a></p>
        <form action="/" enctype="multipart/form-data" id="torrent_form" method="post">
			<span class="file-wrapper">
			<input type="file" name="torrent_file" id="torrent_file" />
			<span class="button">Select .torrent file</span>
			</span>
        </form>
        <br />
        <p>
            Automagically convert your <span style="color: #7BD380;">.torrent</span> files to  <span style="color: #C74907;">Magnet</span> links
        </p>
    </div>
    <div id="footer">
    </div>
</div>
<script>
    var _gaq=[['_setAccount','UA-7265938-23'],['_trackPageview']];
    (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
        g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
        s.parentNode.insertBefore(g,s)}(document,'script'));
</script>
</body>
</html>